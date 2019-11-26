import 'package:finop/const/string_const.dart';
import 'package:finop/screens/app/navigation_home_screen.dart';
import 'package:finop/screens/registration/choice_screen.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/setup_investor_screen.dart';
import 'package:finop/screens/registration/setup_startup_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:finop/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/view_startup_profile.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class RootPage extends StatefulWidget {
  RootPage({this.auth});

  static const String ROUTE_NAME = '/';

  final BaseAuth auth;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.NOT_DETERMINED;
  String _userId = "";
  Widget home;

  @override
  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userId = user?.uid;
        }
        authStatus =
            user?.uid == null ? AuthStatus.NOT_LOGGED_IN : AuthStatus.LOGGED_IN;
      });
    });
    resolveWidget();
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.NOT_LOGGED_IN;
      _userId = "";
    });
  }

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<Widget> determineScreenToShow() async {
    if((await checkIfAccountSetupIsComplete()) && (_userId.length > 0) && (_userId != null)) {
//      return UserProfileScreen();
      return NavigationHomeScreen();
    } else if(await getAccountType() == StringConst.START_UP_VALUE) {
        return SetupStartUpScreen();
    } else if(await getAccountType() == StringConst.INVESTOR_VALUE) {
      return SetupInvestorScreen();
    }
    return buildWaitingScreen();
  }

  resolveWidget() async {
    home = await determineScreenToShow();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case AuthStatus.NOT_LOGGED_IN:
        return SetupStartUpScreen();
//        return SignUpScreen();
//        return LoginScreen();
//        return ChoiceScreen();
        break;
      case AuthStatus.LOGGED_IN:
        return home;
        break;
      default:
        return buildWaitingScreen();
    }
  }

  Future<bool> checkIfAccountSetupIsComplete() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String currentStep = prefs.getString(StringConst.SETUP_STEP_KEY);
    if(currentStep == StringConst.SETUP_COMPLETE_VALUE){
      return true;
    }
    return false;
  }

  Future<String> getAccountType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountType = prefs.get(StringConst.ACCOUNT_TYPE_KEY);
    return accountType;
  }
}
