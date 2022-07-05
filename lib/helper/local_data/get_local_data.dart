import 'package:shared_preferences/shared_preferences.dart';

class LocalDataStorage {
  //CurrentUser=============================
  static Future<String> getCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _value = (pref.getString('current_user') ?? "");
    return _value;
  }

  static Future<void> storeCurrentUser(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('current_user', token);
  }

  static Future<void> removeCurrentUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('current_user');
  }

  //UserSession=============================
  static Future<void> storeUserSession(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('user_session', value);
  }

  static Future<void> removeUserSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('user_session');
  }

  static Future<String> getUserSession() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _value = (pref.getString('user_session') ?? "");
    return _value;
  }

  static Future<void> storeOTPHash(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('otp_hash', value);
  }

  static Future<void> removeOTPHash() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('otp_hash');
  }

  static Future<String> geteOTPHash() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _value = (pref.getString('otp_hash') ?? "");
    return _value;
  }

  //store type String
  static Future<void> storeString(String key, String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String _value = (pref.getString(key) ?? "");
    return _value;
  }

  //store type bool
  static Future<void> storeBool(String key, bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool _value = pref.getBool(key)!;
    return _value;
  }
}
