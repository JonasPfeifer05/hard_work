import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hard_work/widgets/workout_creation_bottomsheet.dart';
import 'package:hard_work/services/workout_data.dart';
import 'package:hard_work/widgets/placeholder_workout.dart';
import 'package:hard_work/widgets/workout.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/database_model.dart';
import '../services/theme_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WorkoutDescriptor> workouts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {
    workouts = await fetchWorkouts();
    setState(() {
      loading = false;
    });
  }

  Future<List<WorkoutDescriptor>> fetchWorkouts() async {
    var database = context.read<DatabaseModel>();
    var auth = context.read<AuthModel>();
    var result = await database
        .forPath(
          UserPathBuilder.forUser(auth.currentUser!.uid).toWorkouts().path,
        )
        .get();

    List<WorkoutDescriptor> descriptors = [];
    for (DataSnapshot workout in result.children) {
      descriptors.add(WorkoutDescriptor(
          workout.key!,
          workout.children
              .where((e) => e.key != "_")
              .map((e) => e.key!)
              .toList()));
    }

    return descriptors;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeModel>().backgroundOne,
      appBar: AppBar(
        leading: const Icon(Icons.fitness_center),
        backgroundColor: context.watch<ThemeModel>().backgroundTwo,
        actions: [
          IconButton(
            onPressed: navigateToStatistics,
            icon: Icon(Icons.stacked_line_chart_rounded,
                color: context.watch<ThemeModel>().fontColor),
          ),
          IconButton(
            onPressed: navigateToSettings,
            icon: Icon(Icons.settings,
                color: context.watch<ThemeModel>().fontColor),
          )
        ],
        title: Text(
          "HardWork",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: context.watch<ThemeModel>().fontColor),
        ),
      ),
      body: ModalProgressHUD(
        color: context.watch<ThemeModel>().backgroundOne!,
        progressIndicator: CircularProgressIndicator(
          color: context.watch<ThemeModel>().highlight!,
        ),
        inAsyncCall: loading,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            if (loading) {
              return null;
            }

            if (index == workouts.length) {
              return PlaceHolderWorkout(
                showWorkoutBottomSheet: showWorkoutBottomSheet,
              );
            }

            return WorkOut(
              data: workouts[index],
              onEdit: onEditWorkout,
            );
          },
          itemCount: workouts.length + 1,
        ),
      ),
    );
  }

  void navigateToStatistics() {
    Navigator.pushNamed(context, "/statistics");
  }

  void navigateToSettings() {
    Navigator.pushNamed(context, "/theme-test");
  }

  void onEditWorkout(WorkoutDescriptor workoutData) async {
    await Navigator.pushNamed(context, "/edit-workout",
        arguments: workoutData.name);
    asyncInitState();
  }

  void showWorkoutBottomSheet() async {
    var newWorkout = await showModalBottomSheet(
      context: context,
      builder: (context) => const WorkoutCreationBottomSheet(),
    ) as String?;

    if (newWorkout != null &&
        workouts.where((element) => element.name == newWorkout).isEmpty) {
      var database = context.read<DatabaseModel>();
      var auth = context.read<AuthModel>();

      var path = UserPathBuilder.forUser(auth.currentUser!.uid)
          .toWorkouts()
          .toWorkout(newWorkout)
          .path;

      await database.forPath(path).set({"_": "_"});

      setState(() {
        workouts.add(WorkoutDescriptor(newWorkout, []));
      });
    }
  }
}
