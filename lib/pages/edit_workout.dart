import 'package:flutter/material.dart';
import 'package:hard_work/services/edit_workout_data.dart';
import 'package:hard_work/services/exercise_data.dart';
import 'package:hard_work/widgets/Exercise.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class EditWorkout extends StatefulWidget {
  const EditWorkout({super.key});

  @override
  State<EditWorkout> createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout> {
  bool loading = true;
  List<ExerciseData> exercises = [];

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {
    exercises = await fetchExercises();

    setState(() {
      loading = false;
    });
  }

  Future<List<ExerciseData>> fetchExercises() async {
    // TODO http request
    await Future.delayed(const Duration(seconds: 1));

    return [
      ExerciseData("Bulgarian Splits", [
        SetHistory([]),
        SetHistory([SetData(8, 10), SetData(10, 7)])
      ])
    ];
  }

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as EditWorkoutData? ??
        EditWorkoutData(0, "Test");

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: context.watch<ThemeModel>().fontColor),
        titleTextStyle: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: context.watch<ThemeModel>().fontColor),
        backgroundColor: context.watch<ThemeModel>().backgroundTwo,
        title: Text(data.workoutName),
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
                    padding: const EdgeInsets.only(top: 25.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                context.watch<ThemeModel>().highlight),
                        onPressed: () {},
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
