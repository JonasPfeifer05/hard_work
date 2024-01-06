import 'package:flutter/material.dart';
import 'package:hard_work/pages/home_page.dart';
import 'package:hard_work/pages/statistics_page.dart';
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
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "statistics": (context) => const StatisticsPage(),
        "/theme-test": (context) => const ThemeTest(),
      },
    );
  }
}
