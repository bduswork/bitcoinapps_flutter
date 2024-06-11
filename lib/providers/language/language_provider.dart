import 'package:btcapp/utils/local_storage/app_sharedpreference.dart';
import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  Locale? _appLocale;
  String? _currLang;

  Locale? get appLocale => _appLocale;
  String? get currLang => _currLang;

  LanguageProvider(){
    loadlangFromSP();
  }

  void loadlangFromSP()async{
    String lang = await AppSharedPreferences().getAppLanguage()?? 'en';
    _appLocale = Locale(lang);
    _currLang = lang;
    notifyListeners();
  }

  void changeLanguage(Locale locale) async{
    _appLocale = locale;

    if(locale == const Locale('en')){
      _currLang = "en";
      await AppSharedPreferences().setAppLanguage('en');
    }else {
      _currLang = "es";
      await AppSharedPreferences().setAppLanguage('es');
    }
    notifyListeners();
  }
}