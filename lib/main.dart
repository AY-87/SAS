import 'package:flutter/material.dart';
import 'package:saas/signup_screen.dart';
import 'package:saas/skipbutton.dart';
import 'create.account.dart';
import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/createaccount' : (context) => CreateAccount(),
        '/SkipButton' : (context) => SkipButton(),
      },
    );
  }
}
