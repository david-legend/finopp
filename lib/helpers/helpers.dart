import 'package:finop/const/_const.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static void saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.USER_ID_KEY, userId);
  }

  static bool formWasEdited = false;
  static bool isEmailValid = false;
  static bool isPasswordValid = false;

  static String validateEmail(String value) {
    formWasEdited = true;
    if (value.isEmpty) {
      isEmailValid = false;
      return 'Email is required.';
    }
    final RegExp nameExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!nameExp.hasMatch(value)) {
      isEmailValid = false;
      return 'Please enter a valid email.';
    }
    isEmailValid = true;
    return null;
  }

  static String validatePassword(String value) {
    formWasEdited = true;
    if (value == null || value.isEmpty) {
      isPasswordValid = false;
      return 'Please enter a password.';
    }
    if (value.length < 6) {
      isPasswordValid = false;
      return 'Password should be more than 5 characters';
    }
    isPasswordValid = true;
    return null;
  }

  static String validatePhoneNumber(String value, bool formWasEdited) {
    formWasEdited = true;
    final RegExp phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (!phoneExp.hasMatch(value))
      return '(###) ###-#### - Enter a US phone number.';
    return null;
  }

  static void handleSubmitted(
      GlobalKey<FormState> formKey, Function showInSnackBar,
      {bool autoValidate = false}) {
    final FormState form = formKey.currentState;
    if (!form.validate()) {
      autoValidate = true; // Start validating on every change.
      showInSnackBar('phone number is');
    } else {
      form.save();
      showInSnackBar('blah blah phone number is ');
    }
  }
}
