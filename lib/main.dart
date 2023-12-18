import 'package:flutter/material.dart';
import 'package:hard_work/pages/edit_workout.dart';
import 'package:hard_work/pages/theme_test.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeModel.darkMode())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: "/theme-test",
      routes: {
        "/theme-test": (context) => const ThemeTest(),
        "/edit-workout": (context) => const EditWorkout()
      },
    );
  }
}
