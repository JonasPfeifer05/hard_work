import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class ThemeTest extends StatelessWidget {
  const ThemeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ThemeModel>().switchTheme();
        },
        child: const Icon(Icons.swap_horiz),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: context.watch<ThemeModel>().backgroundOne,
              child: Center(
                child: Text(
                  "Background One",
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: context.watch<ThemeModel>().backgroundTwo,
              child: Center(
                child: Text(
                  "Background Two",
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: context.watch<ThemeModel>().backgroundThree,
              child: Center(
                child: Text(
                  "Background Three",
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: context.watch<ThemeModel>().highlight,
              child: Center(
                child: Text(
                  "Highlight",
                  style:
                      TextStyle(color: context.watch<ThemeModel>().fontColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
