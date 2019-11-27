import 'package:connectivity/connectivity.dart';
import 'package:finop/const/styles.dart';
import 'package:finop/helpers/helpers.dart';
import 'package:finop/screens/registration/login_screen.dart';
import 'package:finop/screens/registration/setup_investor_screen.dart';
import 'package:finop/screens/registration/setup_startup_screen.dart';
import 'package:finop/services/authentication.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:finop/const/color_const.dart';
import 'package:finop/const/images_const.dart';
import 'package:finop/const/size_const.dart';
import 'package:finop/const/string_const.dart';
import 'package:finop/widgets/signup_arrow_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({this.auth, this.loginCallback});

  final BaseAuth auth;
  final VoidCallback loginCallback;

//  static const String ROUTE_NAME = '/';
  static const String ROUTE_NAME = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSigningUpUser = false;
  bool _autoValidate = true;

  Future<bool> _warnUserAboutInvalidData() async {
    final FormState form = _formKey.currentState;
    if (form == null || !Helper.formWasEdited || form.validate()) return true;

    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('This form has errors'),
              content: const Text('Really leave this form?'),
              actions: <Widget>[
                FlatButton(
                  child: const Text('YES'),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
                FlatButton(
                  child: const Text('NO'),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isSigningUpUser,
        child: Container(
          margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    AppImagePath.finoppLogo,
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
                          Form(
                            key: _formKey,
                            autovalidate: _autoValidate,
                            onWillPop: _warnUserAboutInvalidData,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                dragStartBehavior: DragStartBehavior.down,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: <Widget>[
                                    inputText(
                                      fieldName: "Email",
                                      hintText: "example@gmail.com",
                                      controller: _email,
                                      validator: Helper.validateEmail,
                                      obscure: false,
                                    ),
                                    SizedBox(height: 40.0),
                                    inputText(
                                      fieldName: "Password",
                                      hintText: '',
                                      controller: _password,
                                      validator: Helper.validatePassword,
                                      obscure: true,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        StringConst.SIGN_UP,
                        style: textWithPrimaryColorStyle,
                      ),
                      SizedBox(width: 20.0),
                      SignUpArrowButton(
                        height: 60,
                        width: 60,
                        icon: Icons.arrow_forward,
                        iconSize: 25,
                        onTap: () {
                          if (_email.text.length == 0 &&
                              _password.text.length == 0) {
                            showToast(StringConst.FILL_INPUT_FIELDS,
                                duration: 3);
                          } else if (Helper.isEmailValid &&
                              Helper.isPasswordValid) {
                            initiateSignInProcess();
                          } else {
                            showToast(StringConst.FILL_INPUT_ERRORS,
                                duration: 3);
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    StringConst.SIGN_UP_TEXT,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  InkWell(
                    onTap: () {
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
      ),
    );
  }

  Widget inputText({
    String fieldName,
    String hintText,
    FormFieldValidator<String> validator,
    TextEditingController controller,
    bool obscure,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          fieldName,
          style: textWithTextColorStyle,
        ),
        TextFormField(
          style: TextStyle(
            height: 1.3,
            color: kFINOP_TEXT_COLOR,
          ),
          controller: controller,
          validator: validator,
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
          obscureText: obscure,
        )
      ],
    );
  }

  void turnOnProgressIndicator() {
    setState(() {
      _isSigningUpUser = true;
    });
  }

  void turnOffProgressIndicator() {
    setState(() {
      _isSigningUpUser = false;
    });
  }

  Future<String> signUserUp(String email, String password) async {
    String userId = await widget.auth.signUp(email, password);
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
        String userId = await signUserUp(_email.text, _password.text);

        if (userId.length > 0 && userId != null) {
          //save user ID and navigate to setup
          print("USER_ID:: $userId");
          Helper.saveUserId(userId);
          String accountType = await getAccountType();
          navigateUserToSetupAccount(accountType);
        } else {
          turnOffProgressIndicator();
        }
      } catch (e) {
        print("ERROR:: $e");
        turnOffProgressIndicator();
      }
    }
  }

  Future<String> getAccountType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String accountType = prefs.get(StringConst.ACCOUNT_TYPE_KEY);
    return accountType;
  }

  Future<void> setCurrentStep() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        StringConst.SETUP_STEP_KEY, StringConst.BASIC_INFO_STEP_VALUE);
  }

  void navigateUserToSetupAccount(String accountType) {
    switch (accountType) {
      case StringConst.START_UP_VALUE:
        setCurrentStep();
        Navigator.pushNamed(context, SetupStartUpScreen.ROUTE_NAME);
        break;
      case StringConst.INVESTOR_VALUE:
        setCurrentStep();
        Navigator.pushNamed(context, SetupInvestorScreen.ROUTE_NAME);
        break;
      default:
        Navigator.pushNamed(context, SetupStartUpScreen.ROUTE_NAME);
    }
  }
}
