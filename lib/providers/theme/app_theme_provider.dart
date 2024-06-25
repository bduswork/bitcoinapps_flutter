import 'package:btcapp/utils/local_storage/app_sharedpreference.dart';
import 'package:btcapp/utils/constants/color_constant.dart';
import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  bool _isDarkMode = true;

  bool get isDarkMode => _isDarkMode;

  AppThemeProvider() {
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    _isDarkMode = await AppSharedPreferences().getIsDarkMode() ??
        true; // Default to true (dark mode)
    notifyListeners();
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await AppSharedPreferences().setIsDarkMode(_isDarkMode);
    notifyListeners();
  }

  // Expose current colors based on the theme
  //app primary
  Color get primaryColor => _isDarkMode
      ? DarkThemeColors.primaryColor
      : LightThemeColors.primaryColor;
  Color get backgroundColor => _isDarkMode
      ? DarkThemeColors.backgroundColor
      : LightThemeColors.backgroundColor;
  Color get textColor =>
      _isDarkMode ? DarkThemeColors.textColor : LightThemeColors.textColor;

  //custom button colors
  Color get customButtonColor => _isDarkMode
      ? DarkThemeColors.customButtonColor
      : LightThemeColors.customButtonColor;
  Color get customButtonColorSecondary => _isDarkMode
      ? DarkThemeColors.customButtonColorSecondary
      : LightThemeColors.customButtonColorSecondary;
  Color get customButtonTextColor => _isDarkMode
      ? DarkThemeColors.customButtonTextColor
      : LightThemeColors.customButtonTextColor;
  Color get customButtonBorderGradientColor1 => _isDarkMode
      ? DarkThemeColors.customButtonBorderGradientColor1
      : LightThemeColors.customButtonBorderGradientColor1;
  Color get customButtonBorderGradientColor2 => _isDarkMode
      ? DarkThemeColors.customButtonBorderGradientColor2
      : LightThemeColors.customButtonBorderGradientColor2;

  //custom text field colors
  Color get customTextFieldFillColor => _isDarkMode
      ? DarkThemeColors.customTextFieldFillColor
      : LightThemeColors.customTextFieldFillColor;
  Color get customTextFieldTitleTextColor => _isDarkMode
      ? DarkThemeColors.customTextFieldTitleTextColor
      : LightThemeColors.customTextFieldTitleTextColor;
  Color get customTextFieldTextColor => _isDarkMode
      ? DarkThemeColors.customTextFieldTextColor
      : LightThemeColors.customTextFieldTextColor;
  Color get customTextFieldHintTextColor => _isDarkMode
      ? DarkThemeColors.customTextFieldHintTextColor
      : LightThemeColors.customTextFieldHintTextColor;
  Color get customTextFieldBorderGradientColor1 => _isDarkMode
      ? DarkThemeColors.customTextFieldBorderGradientColor1
      : LightThemeColors.customTextFieldBorderGradientColor1;
  Color get customTextFieldBorderGradientColor2 => _isDarkMode
      ? DarkThemeColors.customTextFieldBorderGradientColor2
      : LightThemeColors.customTextFieldBorderGradientColor2;

  //bottom navigation icon colors
  Color get bottomNavigationBarColor => _isDarkMode
      ? DarkThemeColors.bottomNavigationBarColor
      : LightThemeColors.bottomNavigationBarColor;
  Color get bottomNavigationBarActiveIconColor => _isDarkMode
      ? DarkThemeColors.bottomNavigationBarActiveIconColor
      : LightThemeColors.bottomNavigationBarActiveIconColor;
  Color get bottomNavigationBarBorderGradientColor1 => _isDarkMode
      ? DarkThemeColors.bottomNavigationBarBorderGradientColor1
      : LightThemeColors.bottomNavigationBarBorderGradientColor1;
  Color get bottomNavigationBarBorderGradientColor2 => _isDarkMode
      ? DarkThemeColors.bottomNavigationBarBorderGradientColor2
      : LightThemeColors.bottomNavigationBarBorderGradientColor2;

  //block colors
  Color get blockBackgroundColor => _isDarkMode
      ? DarkThemeColors.blockBackgroundColor
      : LightThemeColors.blockBackgroundColor;
  Color get blockBorderColorTop => _isDarkMode
      ? DarkThemeColors.blockBorderColorTop
      : LightThemeColors.blockBorderColorTop;
  Color get blockBorderColorBottom => _isDarkMode
      ? DarkThemeColors.blockBorderColorBottom
      : LightThemeColors.blockBorderColorBottom;
  Color get blockGridRightBorderColorTop => _isDarkMode
      ? DarkThemeColors.blockGridRightBorderColorTop
      : LightThemeColors.blockGridRightBorderColorTop;
  Color get blockGridRightBorderColorBottom => _isDarkMode
      ? DarkThemeColors.blockGridRightBorderColorBottom
      : LightThemeColors.blockGridRightBorderColorBottom;
  Color get blockEmptyIconColor => _isDarkMode
      ? DarkThemeColors.blockEmptyIconColor
      : LightThemeColors.blockEmptyIconColor;

  // profile colors
  Color get profileIconBorderColor => _isDarkMode
      ? DarkThemeColors.profileIconBorderColor
      : LightThemeColors.profileIconBorderColor;
  Color get profileButtonBackgroundColor => _isDarkMode
      ? DarkThemeColors.profileButtonBackgroundColor
      : LightThemeColors.profileButtonBackgroundColor;
  Color get profileButtonTextColor => _isDarkMode
      ? DarkThemeColors.profileButtonTextColor
      : LightThemeColors.profileButtonTextColor;
  Color get profileTextColor => _isDarkMode
      ? DarkThemeColors.profileTextColor
      : LightThemeColors.profileTextColor;
  Color get profileIconBackgroundColor1 => _isDarkMode
      ? DarkThemeColors.profileIconBackgroundColor1
      : LightThemeColors.profileIconBackgroundColor1;
  Color get profileIconBackgroundColor2 => _isDarkMode
      ? DarkThemeColors.profileIconBackgroundColor2
      : LightThemeColors.profileIconBackgroundColor2;
  Color get profileArrowColor => _isDarkMode
      ? DarkThemeColors.profileArrowColor
      : LightThemeColors.profileArrowColor;
  Color get profileSubtitleColor => _isDarkMode
      ? DarkThemeColors.profileSubtitleColor
      : LightThemeColors.profileSubtitleColor;
  Color get profileCopyIconColor => _isDarkMode
      ? DarkThemeColors.profileCopyIconColor
      : LightThemeColors.profileCopyIconColor;
}
