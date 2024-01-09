import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/theme_model.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.watch<ThemeModel>().backgroundOne,
        appBar: AppBar(
          backgroundColor: context.watch<ThemeModel>().backgroundTwo,
          leading: IconButton(
            icon:
                Icon(Icons.home, color: context.watch<ThemeModel>().fontColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Your statistics",
            style: TextStyle(color: context.watch<ThemeModel>().fontColor),
          ),
        ),
        body: Center(
            child: Text(
          "Coming soon!",
          style: TextStyle(
              color: context.watch<ThemeModel>().fontColor, fontSize: 40),
        )));
  }
}
