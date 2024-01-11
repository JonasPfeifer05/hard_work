import 'package:flutter/material.dart';
import 'package:hard_work/services/exercise_data.dart';
import 'package:hard_work/widgets/set_indicator.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class Exercise extends StatelessWidget {
  final ExerciseData exerciseData;
  final VoidCallback onAddSet;
  final Function(int) onDeleteSet;
  final VoidCallback onDelete;

  const Exercise({
    super.key,
    required this.exerciseData,
    required this.onAddSet,
    required this.onDeleteSet,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          color: context.watch<ThemeModel>().backgroundTwo,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      exerciseData.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: context.watch<ThemeModel>().fontColor),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: IconButton(
                      onPressed: onDelete,
                      icon: const Icon(Icons.delete_forever),
                      color: Colors.redAccent,
                    ),
                  ),
                ],
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
                          setHistory: exerciseData.sets[index],
                          onDelete: () {
                            onDeleteSet(index);
                          },
                        ),
                      ),
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
                    onPressed: onAddSet,
                    child: Text("Add Set",
                        style: TextStyle(
                            color: context.watch<ThemeModel>().fontColor)),
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
