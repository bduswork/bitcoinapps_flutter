import 'package:btcapp/utils/constants/color_constant.dart';
import 'package:btcapp/utils/local_storage/app_sharedpreference.dart';
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

  //dialog colors
  Color get dialogBgColor => _isDarkMode
      ? DarkThemeColors.dialogBgColor
      : LightThemeColors.dialogBgColor;
  Color get dialogTextColor => _isDarkMode
      ? DarkThemeColors.dialogTextColor
      : LightThemeColors.dialogTextColor;
  Color get dialogCloseIconColor => _isDarkMode
      ? DarkThemeColors.dialogCloseIconColor
      : LightThemeColors.dialogCloseIconColor;

  //info button colors
  Color get infoButtonBgColor1 => _isDarkMode
      ? DarkThemeColors.infoButtonBgColor1
      : LightThemeColors.infoButtonBgColor1;
  Color get infoButtonBgColor2 => _isDarkMode
      ? DarkThemeColors.infoButtonBgColor2
      : LightThemeColors.infoButtonBgColor2;
  Color get infoButtonIconColor => _isDarkMode
      ? DarkThemeColors.infoButtonIconColor
      : LightThemeColors.infoButtonIconColor;
  Color get infoButtonBorderColor => _isDarkMode
      ? DarkThemeColors.infoButtonBorderColor
      : LightThemeColors.infoButtonBorderColor;

  //social button colors
  Color get facebookBgColor => _isDarkMode
      ? DarkThemeColors.facebookBgColor
      : LightThemeColors.facebookBgColor;
  Color get googleBgColor => _isDarkMode
      ? DarkThemeColors.googleBgColor
      : LightThemeColors.googleBgColor;
  Color get appleBgColor => _isDarkMode
      ? DarkThemeColors.appleBgColor
      : LightThemeColors.appleBgColor;

  //pinput colors
  Color get pinputBgColor => _isDarkMode
      ? DarkThemeColors.pinputBgColor
      : LightThemeColors.pinputBgColor;

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

// notificaitons
  Color get notificationsBorderColor => _isDarkMode
      ? DarkThemeColors.notificationBorderColor
      : LightThemeColors.notificationBorderColor;

// live price
  Color get livePriceTimeTextColor => _isDarkMode
      ? DarkThemeColors.livePriceTimeTextColor
      : LightThemeColors.livePriceTimeTextColor;
  Color get livePriceViewMarketButtonColor => _isDarkMode
      ? DarkThemeColors.livePriceViewMarketButtonColor
      : LightThemeColors.livePriceViewMarketButtonColor;
  Color get livePriceViewMarketButtonTextColor => _isDarkMode
      ? DarkThemeColors.livePriceViewMarketButtonTextColor
      : LightThemeColors.livePriceViewMarketButtonTextColor;
  Color get livePriceItemColor => _isDarkMode
      ? DarkThemeColors.livePriceItemColor
      : LightThemeColors.livePriceItemColor;
  Color get livePriceViewMarketButtonBorderColor => _isDarkMode
      ? DarkThemeColors.livePriceViewMarketButtonBorderColor
      : LightThemeColors.livePriceViewMarketButtonBorderColor;
  Color get livePriceTimeBackgroundColor => _isDarkMode
      ? DarkThemeColors.livePriceTimeBackgroundColor
      : LightThemeColors.livePriceTimeBackgroundColor;
  Color get livePriceGrowthTextColor => _isDarkMode
      ? DarkThemeColors.livePriceGrowthTextColor
      : LightThemeColors.livePriceGrowthTextColor;
  Color get livePriceGrowthTextBackgroundColor => _isDarkMode
      ? DarkThemeColors.livePriceGrowthTextBackgroundColor
      : LightThemeColors.livePriceGrowthTextBackgroundColor;

// learn bitcoin
  Color get learnBitcoinSloganTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinSloganTextColor
      : LightThemeColors.learnBitcoinSloganTextColor;
  Color get learnBitcoinSearchBarColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinSearchBarColor
      : LightThemeColors.learnBitcoinSearchBarColor;
  Color get learnBitcoinSearchBarHintTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinSearchBarHintTextColor
      : LightThemeColors.learnBitcoinSearchBarHintTextColor;
  Color get learnBitcoinSearchBarIconColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinSearchBarIconColor
      : LightThemeColors.learnBitcoinSearchBarIconColor;
  Color get learnBitcoinSearchBarBorderColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinSearchBarBorderColor
      : LightThemeColors.learnBitcoinSearchBarBorderColor;
  Color get learnBitcoinChipBackgroundColor1 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBackgroundColor1
      : LightThemeColors.learnBitcoinChipBackgroundColor1;
  Color get learnBitcoinChipBackgroundColor2 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBackgroundColor2
      : LightThemeColors.learnBitcoinChipBackgroundColor2;
  Color get learnBitcoinChipBorderColor1 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBorderColor1
      : LightThemeColors.learnBitcoinChipBorderColor1;
  Color get learnBitcoinChipBorderColor2 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBorderColor2
      : LightThemeColors.learnBitcoinChipBorderColor2;
  Color get learnBitcoinChipBorderColor3 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBorderColor3
      : LightThemeColors.learnBitcoinChipBorderColor3;
  Color get learnBitcoinChipBorderColor4 => _isDarkMode
      ? DarkThemeColors.learnBitcoinChipBorderColor4
      : LightThemeColors.learnBitcoinChipBorderColor4;
  Color get learnBitcoinTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinTextColor
      : LightThemeColors.learnBitcoinTextColor;
  Color get learnBitcoinButtonBackgroundColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinButtonBackgroundColor
      : LightThemeColors.learnBitcoinButtonBackgroundColor;
  Color get learnBitcoinButtonTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinButtonTextColor
      : LightThemeColors.learnBitcoinButtonTextColor;
  Color get learnBitcoinButtonBorderColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinButtonBorderColor
      : LightThemeColors.learnBitcoinButtonBorderColor;
  Color get learnBitcoinQuizOptionBackgroundColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizOptionBackgroundColor
      : LightThemeColors.learnBitcoinQuizOptionBackgroundColor;
  Color get learnBitcoinQuizOptionBorderColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizOptionBorderColor
      : LightThemeColors.learnBitcoinQuizOptionBorderColor;
  Color get learnBitcoinQuizOptionTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizOptionTextColor
      : LightThemeColors.learnBitcoinQuizOptionTextColor;
  Color get learnBitcoinQuizSelectedOptionBackgroundColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSelectedOptionBackgroundColor
      : LightThemeColors.learnBitcoinQuizSelectedOptionBackgroundColor;
  Color get learnBitcoinQuizSelectedOptionBorderColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSelectedOptionBorderColor
      : LightThemeColors.learnBitcoinQuizSelectedOptionBorderColor;
  Color get learnBitcoinQuizSelectedOptionTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSelectedOptionTextColor
      : LightThemeColors.learnBitcoinQuizSelectedOptionTextColor;
  Color get learnBitcoinQuizCorrectOptionColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizCorrectOptionColor
      : LightThemeColors.learnBitcoinQuizCorrectOptionColor;
  Color get learnBitcoinQuizSubmitButtonColor1 => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSubmitButtonColor1
      : LightThemeColors.learnBitcoinQuizSubmitButtonColor1;
  Color get learnBitcoinQuizSubmitButtonColor2 => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSubmitButtonColor2
      : LightThemeColors.learnBitcoinQuizSubmitButtonColor2;
  Color get learnBitcoinQuizSubmitButtonTextColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSubmitButtonTextColor
      : LightThemeColors.learnBitcoinQuizSubmitButtonTextColor;
  Color get learnBitcoinQuizSubmitButtonBorderColor => _isDarkMode
      ? DarkThemeColors.learnBitcoinQuizSubmitButtonBorderColor
      : LightThemeColors.learnBitcoinQuizSubmitButtonBorderColor;
}
