import 'package:finop/screens/registration/choice_screen.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: '/choiceScreen',
      routes: {
        ChoiceScreen.ROUTE_NAME: (context) => ChoiceScreen(),
        LoginScreen.ROUTE_NAME: (context) => LoginScreen(),
        SignUpScreen.ROUTE_NAME: (context) => SignUpScreen(),
      },
    );
  }
}


