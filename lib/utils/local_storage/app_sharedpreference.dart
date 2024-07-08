import 'dart:convert';

import 'package:btcapp/models/user_model/user_model.dart';
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

  //save user data
  Future<void> saveUserData(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userModel', json.encode(user.toJson()));
  }

  Future<UserModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('userModel');
    if (userData != null) {
      return UserModel.fromJson(json.decode(userData));
    }
    return null;
  }

  // setter getter for User Is Logged In
  Future setIsUserLoggedIn(bool isLoggedIn) async {
    await prefs.then((value) => value.setBool('ISLOGGEDIN', isLoggedIn));
  }
  Future getIsUserLoggedIn() async {
    return await prefs.then((value) => value.getBool("ISLOGGEDIN"));
  }
  

  // setter getter for User Is Onboarded
  Future setIsOnboarded(bool isOnBoarded) async {
    await prefs.then((value) => value.setBool('ISONBOARDED', isOnBoarded));
  }
  Future getIsOnboarded() async {
    return await prefs.then((value) => value.getBool("ISONBOARDED"));
  }

}