import 'package:flutter/material.dart';
import 'package:hard_work/services/exercise_data.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class SetIndicator extends StatelessWidget {
  final SetHistory? setHistory;
  final VoidCallback? onDelete;
  final bool? disabled;
  final Function(double, int)? onChange;

  double? weight;
  int? reps;

  SetIndicator(
      {super.key,
      this.setHistory,
      this.onDelete,
      this.disabled,
      this.onChange});

  @override
  Widget build(BuildContext context) {
    return setHistory == null
        ? generateHeader(context)
        : generateInput(context);
  }

  Widget generateHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: Container()),
        Expanded(
          flex: 10,
          child: Text(
            "Previous",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.watch<ThemeModel>().fontColor),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            "Weight",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.watch<ThemeModel>().fontColor),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text(
            "Reps",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: context.watch<ThemeModel>().fontColor),
          ),
        ),
      ],
    );
  }

  Widget generateInput(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: IconButton(
            onPressed: onDelete,
            icon: const Icon(Icons.delete_forever),
            color: Colors.redAccent,
          ),
        ),
        Expanded(
          flex: 10,
          child: Text(
            setHistory!.history.length == 1
                ? "/"
                : "${setHistory!.history[setHistory!.history.length - 2].reps}x${setHistory!.history[setHistory!.history.length - 2].weight}kg",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: context.watch<ThemeModel>().fontColor!.withAlpha(80)),
          ),
        ),
        Expanded(
          flex: 5,
          child: FractionallySizedBox(
            widthFactor: 0.80,
            child: TextField(
              onChanged: (value) {
                weight = double.parse(value);
                if (onChange != null && weight != null && reps != null) {
                  onChange!(weight!, reps!);
                }
              },
              readOnly: disabled ?? true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.watch<ThemeModel>().highlight!,
                  ),
                ),
              ),
              cursorColor: context.watch<ThemeModel>().highlight,
              style: TextStyle(color: context.watch<ThemeModel>().fontColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: FractionallySizedBox(
            widthFactor: 0.80,
            child: TextField(
              onChanged: (value) {
                reps = int.parse(value);
                if (onChange != null && weight != null && reps != null) {
                  onChange!(weight!, reps!);
                }
              },
              readOnly: disabled ?? true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: context.watch<ThemeModel>().highlight!,
                  ),
                ),
              ),
              cursorColor: context.watch<ThemeModel>().highlight,
              style: TextStyle(color: context.watch<ThemeModel>().fontColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
