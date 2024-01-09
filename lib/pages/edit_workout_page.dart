import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hard_work/services/exercise_data.dart';
import 'package:hard_work/services/want_to_save_decision.dart';
import 'package:hard_work/widgets/Exercise.dart';
import 'package:hard_work/widgets/select_exercise_modal_sheet.dart';
import 'package:hard_work/widgets/want_to_save_modal_sheet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/database_model.dart';
import '../services/theme_model.dart';

class EditWorkout extends StatefulWidget {
  const EditWorkout({super.key});

  @override
  State<EditWorkout> createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout> {
  bool loading = true;
  List<ExerciseData> exercises = [];
  String workoutName = "Loading...";

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      var data =
          ModalRoute.of(context)!.settings.arguments as String? ?? "Test";
      workoutName = data;

      var database = context.read<DatabaseModel>();
      var auth = context.read<AuthModel>();

      var path = PathBuilder.forUser(auth.currentUser!.uid)
          .toWorkouts()
          .toWorkout(workoutName)
          .path;

      var result = await database.forPath(path).get();

      List<ExerciseData> fetchedExercises = [];
      for (DataSnapshot exercise in result.children) {
        if (exercise.key! == "_") continue;

        List<SetHistory> setHistories = [];
        var json = exercise.children.first.value as String;
        List<dynamic> data = jsonDecode(json);

        for (Map<String, dynamic> history in data) {
          List<SetData> setData = [];

          List<dynamic> historyDataList = history["history"];

          for (Map<String, dynamic> historyData in historyDataList) {
            var weight = historyData["weight"] as double;
            var reps = historyData["reps"] as int;
            setData.add(SetData(weight, reps));
          }

          setHistories.add(SetHistory(setData));
        }

        fetchedExercises.add(ExerciseData(exercise.key!, setHistories));
      }
      exercises = fetchedExercises;

      setState(() {
        loading = false;
      });
    });
  }

  void saveWorkout() async {
    var database = context.read<DatabaseModel>();
    var auth = context.read<AuthModel>();

    var path = PathBuilder.forUser(auth.currentUser!.uid)
        .toWorkouts()
        .toWorkout(workoutName)
        .path;

    var ref = database.forPath(path);
    await ref.set({"_": "_"});
    for (var value in exercises) {
      ref.update({
        value.name: {"_": jsonEncode(value.sets)}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () async {
            var decision = (await showModalBottomSheet(
              context: context,
              builder: (context) {
                return const WantToSaveModalSheet();
              },
            )) as WantToSaveDecision?;

            if (decision == WantToSaveDecision.discard) {
              Navigator.pop(context);
            } else if (decision == WantToSaveDecision.save) {
              saveWorkout();
              await Future.delayed(const Duration(milliseconds: 500));
              Navigator.pop(context);
            }
          },
        ),
        iconTheme: IconThemeData(color: context.watch<ThemeModel>().fontColor),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: context.watch<ThemeModel>().fontColor),
        backgroundColor: context.watch<ThemeModel>().backgroundTwo,
        title: Text(workoutName),
      ),
      body: Container(
        color: context.watch<ThemeModel>().backgroundOne,
        child: ModalProgressHUD(
          color: context.watch<ThemeModel>().backgroundOne!,
          progressIndicator: CircularProgressIndicator(
            color: context.watch<ThemeModel>().highlight!,
          ),
          inAsyncCall: loading,
          child: ListView.builder(
            itemCount: loading ? 0 : exercises.length + 1,
            itemBuilder: (context, index) => index < exercises.length
                ? Exercise(
                    exerciseData: exercises[index],
                    onDeleteSet: (setIndex) {
                      setState(() {
                        exercises[index].sets.removeAt(setIndex);
                      });
                    },
                    onAddSet: () {
                      setState(() {
                        exercises[index].sets.add(SetHistory([]));
                      });
                    },
                    onDelete: () {
                      setState(() {
                        exercises.removeAt(index);
                      });
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                context.watch<ThemeModel>().highlight),
                        onPressed: () async {
                          var exercise = (await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SelectExerciseModalSheet();
                            },
                          )) as String?;

                          if (exercise != null) {
                            setState(() {
                              exercises.add(
                                  ExerciseData(exercise, [SetHistory([])]));
                            });
                          }
                        },
                        child: const Text("Add New Exercise"),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
