import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class PlaceHolderWorkout extends StatelessWidget {
  const PlaceHolderWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.watch<ThemeModel>().backgroundTwo,
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(20),
      child: RawMaterialButton(
        onPressed: () {
          addNewWorkout();
        },
        child: GridTile(
          child: Center(
            child: Icon(Icons.add,
                color: context.watch<ThemeModel>().fontColor, size: 45),
          ),
        ),
      ),
    );
  }

  void addNewWorkout() {
    // TODO add a new workout; should i do this with a modal bottom sheet or differently?
  }
}
