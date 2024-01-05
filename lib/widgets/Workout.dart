import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/WorkoutData.dart';
import '../services/theme_model.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key, required this.data});

  final WorkoutData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context
              .watch<ThemeModel>()
              .backgroundOne,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(20),
      child: GridTile(
        header: Center(
            child: Text(
              data.name,
              style: TextStyle(color: context
                  .watch<ThemeModel>()
                  .fontColor),
            )),
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 30),
          child: Column(
            children: [
              for (var value in data.exercises) Text(value, style: TextStyle(color: context.watch<ThemeModel>().fontColor),)
            ],
          ),
        ),
      ),
    );
  }
}
