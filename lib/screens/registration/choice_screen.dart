import 'package:finop/const/_const.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChoiceScreen extends StatelessWidget {
//  static const String ROUTE_NAME = '/';
  static const String ROUTE_NAME = '/choiceScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          StringConst.CHOICE_SCREEN_WELCOME_MSG,
                          style: bigHeadingStyle,
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        SvgPicture.asset(
                          RegistrationImagePath.choiceScreen,
                          height: 250.0,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              saveAccountType(StringConst.START_UP_VALUE);
                              Navigator.pushNamed(
                                  context, SignUpScreen.ROUTE_NAME);
                            },
                            color: kFINOP_PRIMARY,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                StringConst.SIGN_UP_START_UP,
                                textAlign: TextAlign.center,
                                style: submitButtonStyle,
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
                              Navigator.pushNamed(
                                  context, SignUpScreen.ROUTE_NAME);
                            },
                            color: kFINOP_SECONDARY,
                            child: Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: Text(
                                StringConst.SIGN_UP_INVESTOR,
                                textAlign: TextAlign.center,
                                style: submitButtonStyle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          StringConst.SIGN_IN_TEXT,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
                          },
                          child: Text(
                            StringConst.SIGN_IN,
                            style: TextStyle(
                                color: kFINOP_SECONDARY,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(12.0),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  children: <Widget>[
//                    InkWell(
//                      onTap: (){
//                        Navigator.pushNamed(context, LoginScreen.ROUTE_NAME);
//                      },
//                      child: Text(
//                        'Already have an account ? Login',
//                        style: TextStyle(fontSize: 16.0),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
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
