import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomInfoButton extends StatefulWidget {
  const CustomInfoButton({super.key});

  @override
  State<CustomInfoButton> createState() => _CustomInfoButtonState();
}

class _CustomInfoButtonState extends State<CustomInfoButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return Container(
          // height: 24,
          // width: 24,
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: appThemeProvider.infoButtonBorderColor
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                appThemeProvider.infoButtonBgColor1,
                appThemeProvider.infoButtonBgColor2,
              ],
            ),
            shape: BoxShape.circle
          ),
          child: Text("i", style: TextStyle(color: appThemeProvider.infoButtonIconColor),),
        );
      }
    );
  }
}