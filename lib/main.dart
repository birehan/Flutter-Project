import 'package:flutter/material.dart';
import 'package:signup_login/signup_page.dart';
import 'loginpage.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LogInScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SignUpPage(),
      },
      title: "Log in Page",
      debugShowCheckedModeBanner: false,
    );
  }
}
