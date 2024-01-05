import 'package:flutter/material.dart';
import 'package:hard_work/services/WorkoutData.dart';
import 'package:hard_work/widgets/PlaceHolderWorkout.dart';
import 'package:hard_work/widgets/Workout.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<WorkoutData> workouts = [
    WorkoutData("Legday", ["exercise 1", "exercise 2"]),
    WorkoutData("Legday", ["exercise 1", "exercise 2"]),
    WorkoutData("Legday", ["exercise 1", "exercise 2"]),
    WorkoutData("Legday", ["exercise 1", "exercise 2"]),
    WorkoutData("Legday", ["exercise 1", "exercise 2"]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text("PLACEHOLDER"),
        // Just temporary; logo should be used there
        actions: [
          IconButton(
              onPressed: () {
                navigateToStatistics();
              },
              icon: const Icon(Icons.stacked_line_chart_rounded))
        ],
        title: const Text("HardWork"),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          if (index >= workouts.length){
            return const PlaceHolderWorkout();
          }
          return WorkOut(data: workouts[index]);

        },
        itemCount: workouts.length + 1,
      ),
    );
  }

  void navigateToStatistics() {}
}
