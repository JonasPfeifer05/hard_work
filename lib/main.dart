import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hard_work/pages/edit_workout_page.dart';
import 'package:hard_work/pages/login_register_page.dart';
import 'package:hard_work/pages/theme_test.dart';
import 'package:hard_work/services/auth.dart';
import 'package:hard_work/services/theme_model.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeModel.darkMode()),
    ChangeNotifierProvider(create: (_) => AuthModel()),
  ], child: const PageTree()));
}

class PageTree extends StatelessWidget {
  const PageTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthModel>().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MyApp();
        } else {
          return const LoginRegisterPage();
        }
      },
    );
  }
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
