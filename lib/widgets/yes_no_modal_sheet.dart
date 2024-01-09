import 'package:flutter/material.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:hard_work/services/yes_no_decision.dart';
import 'package:provider/provider.dart';

class YesNoModalSheet extends StatelessWidget {
  final String title;

  const YesNoModalSheet({super.key, required this.title});

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
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          Navigator.pop(context, YesNoDecision.no);
                        },
                        child: const Text("No"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 90,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen),
                        onPressed: () {
                          Navigator.pop(context, YesNoDecision.yes);
                        },
                        child: const Text("Yes"),
                      ),
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
