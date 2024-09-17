import 'package:shared_preferences/shared_preferences.dart';

class AppHelper {
  late SharedPreferences prefs;

  saveBoolPref(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  deleteBoolPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  Future<bool?> getBoolPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
