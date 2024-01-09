import 'package:flutter/material.dart';
import 'package:hard_work/services/workout_data.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:provider/provider.dart';

class WorkoutCreationBottomSheet extends StatefulWidget {
  final Function addItem;

  const WorkoutCreationBottomSheet({super.key, required this.addItem});

  @override
  State<WorkoutCreationBottomSheet> createState() =>
      _WorkoutCreationBottomSheetState();
}

class _WorkoutCreationBottomSheetState
    extends State<WorkoutCreationBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController workoutInput = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.watch<ThemeModel>().backgroundOne,
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Center(
              child: TextField(
                  controller: workoutInput,
                  maxLength: 13,
                  onChanged: (string) {
                    if (string == ""){
                      errorMessage = "Name is not allowed to be empty!";
                      setState(() {
                      });
                    }
                  },
                  onTap: () {},
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.watch<ThemeModel>().fontColor!)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: context.watch<ThemeModel>().highlight!)),
                  ),
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                  cursorColor: context.watch<ThemeModel>().highlight),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Center(
                  child: Text(
                errorMessage,
                style: TextStyle(color: context.watch<ThemeModel>().highlight, fontSize: 16),
              )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.add,
                      color: context.watch<ThemeModel>().fontColor),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith(
                          (states) =>
                              context.watch<ThemeModel>().backgroundTwo!)),
                  onPressed: () {
                    if (workoutInput.text == "") {
                      return;
                    }
                    widget.addItem(WorkoutData(workoutInput.text, []));
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
