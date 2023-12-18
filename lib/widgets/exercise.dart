import 'package:flutter/material.dart';
import 'package:hard_work/services/exercise_data.dart';
import 'package:hard_work/widgets/set_indicator.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class Exercise extends StatelessWidget {
  final ExerciseData exerciseData;

  const Exercise({super.key, required this.exerciseData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: context.watch<ThemeModel>().backgroundTwo,
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    exerciseData.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: context.watch<ThemeModel>().fontColor),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.98,
                child: Divider(
                  color: context.watch<ThemeModel>().backgroundThree,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: extend(
                      List.generate(
                          exerciseData.sets.length,
                          (index) => SetIndicator(
                              setHistory: exerciseData.sets[index])),
                      const SetIndicator(),
                      0,
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.watch<ThemeModel>().highlight!,
                    ),
                    onPressed: () {},
                    child: const Text("Add Set"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> extend(List<Widget> list, Widget item, int? index) {
    if (index == null) {
      list.add(item);
    } else {
      list.insert(index, item);
    }
    return list;
  }
}
