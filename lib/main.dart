import 'package:finop/screens/app/home_screen.dart';
import 'package:finop/screens/registration/choice_screen.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/setup_investor_screen.dart';
import 'package:finop/screens/registration/setup_startup_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:finop/screens/root_page.dart';
import 'package:finop/services/authentication.dart';
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
        RootPage.ROUTE_NAME: (context) => RootPage(auth: new Auth(),),
        ChoiceScreen.ROUTE_NAME: (context) => ChoiceScreen(),
        LoginScreen.ROUTE_NAME: (context) => LoginScreen(auth: Auth(),),
        SignUpScreen.ROUTE_NAME: (context) => SignUpScreen(auth: Auth(),),
        SetupStartUpScreen.ROUTE_NAME: (context) => SetupStartUpScreen(),
        SetupInvestorScreen.ROUTE_NAME: (context) => SetupInvestorScreen(),
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
      },
    );
  }
}

