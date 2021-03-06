import 'package:finop/screens/app/chats.dart';
import 'package:finop/screens/app/investor_profile.dart';
import 'package:finop/screens/app/navigation_home_screen.dart';
import 'package:finop/screens/app/startup_profile.dart';
import 'package:finop/screens/app/user_profile_screen.dart';
import 'package:finop/screens/registration/choice_screen.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/onboarding_investor_screen.dart';
import 'package:finop/screens/registration/onboarding_startup_screen.dart';
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
      title: 'Finopp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.white,
      ),
//      home: '/choiceScreen',
      routes: {
        RootPage.ROUTE_NAME: (context) => RootPage(auth: Auth(),),
        ChoiceScreen.ROUTE_NAME: (context) => ChoiceScreen(),
        StartUpOnboardingScreen.ROUTE_NAME: (context) => StartUpOnboardingScreen(),
        InvestorOnboardingScreen.ROUTE_NAME: (context) => InvestorOnboardingScreen(),
        LoginScreen.ROUTE_NAME: (context) => LoginScreen(auth:  Auth(),),
        SignUpScreen.ROUTE_NAME: (context) => SignUpScreen(auth: Auth(),),
        SetupStartUpScreen.ROUTE_NAME: (context) => SetupStartUpScreen(),
        SetupInvestorScreen.ROUTE_NAME: (context) => SetupInvestorScreen(),
        NavigationHomeScreen.ROUTE_NAME: (context) => NavigationHomeScreen(),
        StartUpProfile.ROUTE_NAME: (context) => StartUpProfile(),
        InvestorProfile.ROUTE_NAME: (context) => InvestorProfile(),
        UserProfileScreen.ROUTE_NAME: (context) => UserProfileScreen(),
        Chats.ROUTE_NAME: (context) => Chats(),
      },
    );
  }
}
