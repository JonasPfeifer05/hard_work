import 'package:flutter/material.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:provider/provider.dart';

import '../services/database_model.dart';

class SelectExerciseModalSheet extends StatefulWidget {
  const SelectExerciseModalSheet({super.key});

  @override
  State<SelectExerciseModalSheet> createState() =>
      _SelectExerciseModalSheetState();
}

class _SelectExerciseModalSheetState extends State<SelectExerciseModalSheet> {
  List<String> exercises = [];
  bool loading = true;
  String selected = "";

  @override
  void initState() {
    asyncInitState();
    super.initState();
  }

  void asyncInitState() async {
    var database = context.read<DatabaseModel>();

    var result = await database.forPath("exercises").get();

    exercises =
        (result.value! as String).split(",").map((e) => e.trim()).toList();

    setState(() {
      loading = false;
      selected = exercises.first;
    });
  }

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
                child: DropdownMenu<String>(
                  enabled: !loading,
                  hintText: "Loading...",
                  trailingIcon: Icon(Icons.arrow_drop_down,
                      color: context.watch<ThemeModel>().backgroundThree),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: const TextStyle(color: Colors.redAccent),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.redAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.watch<ThemeModel>().backgroundThree!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: context.watch<ThemeModel>().highlight!,
                      ),
                    ),
                  ),
                  menuStyle: MenuStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        context.watch<ThemeModel>().backgroundThree!),
                  ),
                  textStyle: TextStyle(
                    color: context.watch<ThemeModel>().fontColor,
                  ),
                  width: 216,
                  initialSelection: loading ? "" : exercises.first,
                  dropdownMenuEntries: exercises.map<DropdownMenuEntry<String>>(
                    (e) {
                      return DropdownMenuEntry(
                        value: e,
                        label: e,
                        style: MenuItemButton.styleFrom(
                            foregroundColor:
                                context.watch<ThemeModel>().fontColor),
                      );
                    },
                  ).toList(),
                  onSelected: (value) {
                    selected = value!;
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Cancel",
                            style: TextStyle(
                                color: context.watch<ThemeModel>().fontColor)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                context.watch<ThemeModel>().highlight),
                        onPressed: () {
                          Navigator.pop(context, selected);
                        },
                        child: Text("Add",
                            style: TextStyle(
                                color: context.watch<ThemeModel>().fontColor)),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
