import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/workout_data.dart';
import '../services/theme_model.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key, required this.data});

  final WorkoutData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.watch<ThemeModel>().backgroundTwo,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(20),
      child: RawMaterialButton(
        onPressed: () {
          editWorkOut();
        },
        child: GridTile(
          header: Center(
              child: Container(
            margin: const EdgeInsets.only(top: 10),
            child: Text(
              data.name,
              style: TextStyle(
                  color: context.watch<ThemeModel>().fontColor, fontSize: 18),
            ),
          )),
          child: Container(
            margin: const EdgeInsetsDirectional.only(top: 40),
            child: Column(
              children: [
                // TODO implement the use of Exercise not just text
                for (var value in data.exercises)
                  Text(
                    value,
                    style: TextStyle(
                        color: context.watch<ThemeModel>().fontColor,
                        fontSize: 15),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void editWorkOut() {
    // TODO navigate to page to edit the Workout
  }
}
