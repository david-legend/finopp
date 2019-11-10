import 'package:finop/const/_const.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoiceScreen extends StatelessWidget {
  static const String ROUTE_NAME = '/';
//  static const String ROUTE_NAME = '/choiceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(RegistrationImagePath.choiceScreen),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  StringConst.CHOICE_SCREEN_WELCOME_MSG,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 30),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    saveAccountType(StringConst.START_UP_VALUE);
                    Navigator.pushNamed(context, SignUpScreen.ROUTE_NAME);
                  },
                  color: kFINOP_ORANGE,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      StringConst.SIGN_UP_START_UP,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.height,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                child: RaisedButton(
                  onPressed: () {
                    saveAccountType(StringConst.INVESTOR_VALUE);
                    Navigator.pushNamed(context, SignUpScreen.ROUTE_NAME);
                  },
                  color: kFINOP_ORANGE,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      StringConst.SIGN_UP_INVESTOR,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveAccountType(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.ACCOUNT_TYPE_KEY, value);
  }


}
