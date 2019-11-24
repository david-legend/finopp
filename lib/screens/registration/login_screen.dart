import 'package:connectivity/connectivity.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/helpers/helpers.dart';
import 'package:finop/screens/app/navigation_home_screen.dart';
import 'package:finop/screens/registration/signup_screen.dart';
import 'package:finop/services/authentication.dart';
import 'package:flutter/material.dart';

import 'package:finop/const/color_const.dart';
import 'package:finop/const/gradient_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/size_const.dart';
import 'package:finop/const/string_const.dart';
import 'package:finop/widgets/signup_arrow_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

  static const String ROUTE_NAME = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _isSigningInUser = false;

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isSigningInUser,
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/finop/finopp.png',
                    height: _media.height / 12,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    StringConst.REGISTER_INFO_TEXT,
                    textAlign: TextAlign.center,
                    style: textWithSecondaryColorStyle,
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      color: kFINOP_DARK_SHADE,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 12,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        children: <Widget>[
                          inputText(
                              "Email", 'example@gmail.com', _email, false),
                          SizedBox(height: 40.0),
                          inputText("Password", '******', _password, true),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        StringConst.SIGN_IN,
                        style: textWithPrimaryColorStyle,
                      ),
                      SizedBox(width: 20.0),
                      SignUpArrowButton(
                        height: 60,
                        width: 60,
                        icon: Icons.arrow_forward,
                        iconSize: 25,
                        onTap: () {},
                      )
                    ],
                  ),
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
                      Navigator.pushNamed(context, SignUpScreen.ROUTE_NAME);
                    },
                    child: Text(
                      StringConst.SIGN_UP,
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
      ),
    );
  }

  Widget inputText(
    String fieldName,
    String hintText,
    TextEditingController controller,
    bool obSecure,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: textWithTextColorStyle,
        ),
        TextField(
          style: TextStyle(
            height: 1.3,
            color: kFINOP_TEXT_COLOR,
          ),
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: TEXT_NORMAL_SIZE,
              color: kFINOP_TEXT_COLOR,
              fontWeight: FontWeight.w400,
            ),
            labelStyle: TextStyle(
              fontSize: TEXT_NORMAL_SIZE,
              color: kFINOP_TEXT_COLOR,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
              height: 0,
            ),
          ),
          obscureText: obSecure,
        )
      ],
    );
  }

  void turnOnProgressIndicator() {
    setState(() {
      _isSigningInUser = true;
    });
  }

  void turnOffProgressIndicator() {
    setState(() {
      _isSigningInUser = false;
    });
  }

  Future<String> signUserIn(String email, String password) async {
    String userId = await widget.auth.signIn(email, password);
    return userId;
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      showToast(StringConst.NO_INTERNET_CONNECTION, duration: 3);
    }
    return false;
  }

  void showToast(String msg, {int duration}) {
    Toast.show(msg, context, duration: duration, gravity: Toast.BOTTOM);
  }

  initiateSignInProcess() async {
    if (await checkInternetConnection()) {
      try {
        turnOnProgressIndicator();
        String userId = await signUserIn(_email.text, _password.text);

        if (userId.length > 0 && userId != null) {
          //save user ID and navigate to setup
          print("USER_ID:: $userId");
          Helper.saveUserId(userId);
          navigateUserToHome();
        } else {
          turnOffProgressIndicator();
        }
      } catch (e) {
        print("ERROR:: $e");
        turnOffProgressIndicator();
      }
    }
  }

  void navigateUserToHome() {
    Navigator.pushNamed(context, NavigationHomeScreen.ROUTE_NAME);
  }
}
