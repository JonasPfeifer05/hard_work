import 'package:flutter/material.dart';
import 'package:hard_work/services/WorkoutData.dart';
import 'package:hard_work/widgets/PlaceHolderWorkout.dart';
import 'package:hard_work/widgets/Workout.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<WorkoutData> workouts = [];

  bool loading = true;

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  void asyncInitState() async {
    workouts = await fetchWorkouts().whenComplete(() {
      setState(() {
        loading = false;
      });
    });

  }

  Future<List<WorkoutData>> fetchWorkouts() async {
    // TODO with HTTP Requests
    await Future.delayed(const Duration(seconds: 2));

    return [
      WorkoutData("Legday", ["exercise 1", "exercise 2"]),
      WorkoutData("Legday", ["exercise 1", "exercise 2"]),
      WorkoutData("Legday", ["exercise 1", "exercise 2"]),
      WorkoutData("Legday", ["exercise 1", "exercise 2"]),
      WorkoutData("Legday", ["exercise 1", "exercise 2"]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeModel>().backgroundOne,
      appBar: AppBar(
        leading: Text(
          // Just temporary; logo should be used there
          "PLACEHOLDER",
          style: TextStyle(color: context.watch<ThemeModel>().fontColor),
        ),
        backgroundColor: context.watch<ThemeModel>().backgroundTwo,
        actions: [
          IconButton(
              onPressed: () {
                navigateToStatistics();
              },
              icon: Icon(Icons.stacked_line_chart_rounded,
                  color: context.watch<ThemeModel>().fontColor))
        ],
        title: Text(
          "HardWork",
          style: TextStyle(color: context.watch<ThemeModel>().fontColor),
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
            if (loading) return null;       // display add button when not finished loading???
            if (index >= workouts.length) {
              return const PlaceHolderWorkout();
            }
            return WorkOut(data: workouts[index]);
          },
          itemCount: workouts.length + 1,
        ),
      ),
    );
  }

  void navigateToStatistics() {}
}
