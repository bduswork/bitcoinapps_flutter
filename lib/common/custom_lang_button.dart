import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomLangButton extends StatelessWidget {
  final String title;
  final Icon trailingIcon;
  final VoidCallback onTap;

  const CustomLangButton({
    super.key,
    required this.title,
    required this.trailingIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
            height: 48,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: appThemeProvider.textColor
              ),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: appThemeProvider.textColor, fontSize: 16, fontWeight: FontWeight.w400),),
                  trailingIcon
                ],
              ),
            ),
          );
        },
      )
    );
  }
}