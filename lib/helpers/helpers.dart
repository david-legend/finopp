import 'package:finop/const/_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {

  static void saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(StringConst.USER_ID_KEY, userId);
  }

}