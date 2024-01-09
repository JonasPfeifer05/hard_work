import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/workout_data.dart';
import '../services/theme_model.dart';

class WorkOut extends StatelessWidget {
  const WorkOut({super.key, required this.data, required this.onEdit});

  final WorkoutDescriptor data;
  final Function(WorkoutDescriptor) onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.watch<ThemeModel>().backgroundTwo,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(20),
      child: RawMaterialButton(
        onPressed: () {
          onEdit(data);
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
                for (var value in data.exercises)
                  Text(
                    value,
                    style: TextStyle(
                        color: context
                            .watch<ThemeModel>()
                            .fontColor!
                            .withAlpha(50),
                        fontSize: 15),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
