import 'package:shared_preferences/shared_preferences.dart';

class SPUtill {
  static String keySelectLanguage = "key_select_language";
  static String keyAuthToken = "key_Auth_token";
  static String keyName = "key_Name";
  static String keyUserId = "user_id";
  static String keyAvatar = "key_avatar";
  static String keyEmail = "key_email";
  static String keyStatus = "key_status";
  static String keyJoinDate = "key_join_date";
  static String keyMobile = "key_mobile";
  static String keyDateBirth = "key_date_of_birth";
  static String keyVerificationSetUp = "verification_setup";

  static setValue(String key, String? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value!);
  }

  static Future<String?> getValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getString(key);
      return value;
    } catch (error) {
      return null;
    }
  }

  static deleteKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static setLanguageIntValue(String key, int? value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value!);
  }

  static Future<int?> getSelectLanguage(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      var value = prefs.getInt(key);
      return value;
    } catch (error) {
      return null;
    }
  }
}
