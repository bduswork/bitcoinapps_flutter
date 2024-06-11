import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool? isLoading;
  final bool isPrimary;

  const CustomRoundedButton({super.key, 
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
              borderRadius: BorderRadius.circular(30.0),
              border: isPrimary? null
              : Border.all(color: appThemeProvider.customButtonColor),
              color: isPrimary? appThemeProvider.customButtonColor : Colors.transparent
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isPrimary? appThemeProvider.customButtonTextColor : appThemeProvider.customButtonColor,
                fontSize: 16,
              ),
            ),
          );
        }
      ),
    );
  }
}