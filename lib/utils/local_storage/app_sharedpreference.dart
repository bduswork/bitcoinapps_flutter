import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences{

  Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // setter getter for theme "true/false"
  Future setIsDarkMode(bool mode) async {
    await prefs.then((value) => value.setBool("appmode", mode));
  }

  Future getIsDarkMode() async {
    return await prefs.then((value) => value.getBool("appmode"));
  }

  // setter getter for User App Language
  Future setAppLanguage(String appLang) async {
    await prefs.then((value) => value.setString('language_code', appLang));
  }
  Future getAppLanguage() async {
    return await prefs.then((value) => value.getString("language_code"));
  }

}