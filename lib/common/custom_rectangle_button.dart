import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

class CustomRectangleButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final bool isPrimary;

  const CustomRectangleButton({super.key, 
    required this.title, 
    required this.onPressed, 
    this.isLoading=false, 
    required this.isPrimary
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: isLoading! ? null : onPressed,
      child: Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return Container(
            height: 48,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: GradientBoxBorder(
                gradient: appThemeProvider.isDarkMode? LinearGradient(
                  colors: [appThemeProvider.customButtonBorderGradientColor1, appThemeProvider.customButtonBorderGradientColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ) : LinearGradient(
                  colors: [appThemeProvider.customButtonColor, appThemeProvider.customButtonColor],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
              color: isPrimary? appThemeProvider.customButtonColor : appThemeProvider.customButtonColorSecondary
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isPrimary? appThemeProvider.customButtonTextColor : appThemeProvider.isDarkMode? appThemeProvider.customButtonTextColor : appThemeProvider.customButtonColor,
                fontSize: 16,
              ),
            ),
          );
        },
      ),
    );
  }
}