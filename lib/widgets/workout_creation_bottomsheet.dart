import 'package:flutter/material.dart';
import 'package:hard_work/services/workout_data.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:provider/provider.dart';

class WorkoutCreationBottomSheet extends StatefulWidget {
  const WorkoutCreationBottomSheet({super.key});

  @override
  State<WorkoutCreationBottomSheet> createState() =>
      _WorkoutCreationBottomSheetState();
}

class _WorkoutCreationBottomSheetState
    extends State<WorkoutCreationBottomSheet> {
  TextEditingController workoutInput = TextEditingController();
  String errorMessage = "Name is not allowed to be empty!";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: context.watch<ThemeModel>().backgroundTwo,
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 16.0, 8, 8),
              child: Text(
                "Enter workout name:",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: context.watch<ThemeModel>().fontColor),
              ),
            ),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextField(
                  controller: workoutInput,
                  maxLength: 13,
                  onChanged: (string) {
                    setState(() {
                      if (string == "") {
                        errorMessage = "Name is not allowed to be empty!";
                      } else {
                        errorMessage = "";
                      }
                    });
                  },
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(
                        color: context.watch<ThemeModel>().backgroundThree),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: context.watch<ThemeModel>().backgroundThree!),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: context.watch<ThemeModel>().highlight!),
                    ),
                  ),
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                  cursorColor: context.watch<ThemeModel>().highlight),
            ),
            errorMessage == ""
                ? Container()
                : Container(
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(color: Colors.redAccent),
                      ),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.redAccent,
                    backgroundColor: context.watch<ThemeModel>().highlight,
                  ),
                  onPressed: errorMessage != ""
                      ? null
                      : () {
                          Navigator.pop(context, workoutInput.text);
                        },
                  child: Text("Add",
                      style: TextStyle(
                          color: context.watch<ThemeModel>().fontColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
