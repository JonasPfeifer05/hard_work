import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth.dart';
import '../services/theme_model.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool login = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FractionallySizedBox(
          widthFactor: 1,
          heightFactor: 1,
          child: Container(
            color: context.watch<ThemeModel>().backgroundOne,
            child: Center(
              child: FittedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        login ? "Login" : "Register",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                color: context.watch<ThemeModel>().fontColor),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          cursorColor: context.watch<ThemeModel>().highlight,
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color:
                                  context.watch<ThemeModel>().backgroundThree,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: context
                                    .watch<ThemeModel>()
                                    .backgroundThree!,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: context.watch<ThemeModel>().highlight!,
                              ),
                            ),
                          ),
                          onChanged: (_) {
                            setState(() {});
                          },
                          style: TextStyle(
                              color: context.watch<ThemeModel>().fontColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 250,
                        child: TextField(
                          cursorColor: context.watch<ThemeModel>().highlight,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passwordController,
                          onChanged: (_) {
                            setState(() {});
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color:
                                  context.watch<ThemeModel>().backgroundThree,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: context
                                    .watch<ThemeModel>()
                                    .backgroundThree!,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: context.watch<ThemeModel>().highlight!,
                              ),
                            ),
                          ),
                          style: TextStyle(
                              color: context.watch<ThemeModel>().fontColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 250,
                        height: 35,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  context.watch<ThemeModel>().fontColor,
                              disabledForegroundColor:
                                  context.watch<ThemeModel>().fontColor,
                              backgroundColor:
                                  context.watch<ThemeModel>().highlight,
                              disabledBackgroundColor: Colors.redAccent),
                          onPressed: emailController.text.isEmpty ||
                                  passwordController.text.isEmpty
                              ? null
                              : () {
                                  if (login) {
                                    context
                                        .read<AuthModel>()
                                        .signInWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  } else {
                                    context
                                        .read<AuthModel>()
                                        .createUserWithEmailAndPassword(
                                            email: emailController.text,
                                            password: passwordController.text);
                                  }
                                },
                          child: Text("Proceed",
                              style: TextStyle(
                                  color:
                                      context.watch<ThemeModel>().fontColor)),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          login = !login;
                        });
                      },
                      child: Text(
                          login
                              ? "Don't have an account yet?"
                              : "Already have an account?",
                          style: const TextStyle(
                              color: Colors.lightBlue,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
