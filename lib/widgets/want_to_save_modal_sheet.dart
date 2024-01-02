import 'package:flutter/material.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:hard_work/services/want_to_save_decision.dart';
import 'package:provider/provider.dart';

class WantToSaveModalSheet extends StatelessWidget {
  const WantToSaveModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.watch<ThemeModel>().backgroundTwo,
      child: Center(
        child: FittedBox(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Do you want to save the changes?",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              context.watch<ThemeModel>().highlight),
                      onPressed: () {
                        Navigator.pop(context, WantToSaveDecision.cancel);
                      },
                      child: const Text("Cancel"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          Navigator.pop(context, WantToSaveDecision.discard);
                        },
                        child: const Text("Discard"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen),
                      onPressed: () {
                        Navigator.pop(context, WantToSaveDecision.save);
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
