import 'package:shared_preferences/shared_preferences.dart';

class SharedPreffrencerhelper {
  static const String themekey = "isDark";
  static Future<void> saveTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themekey, isDark);
  }

  static Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themekey) ?? false;
  }
}
