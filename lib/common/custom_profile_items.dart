import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const ListItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  appThemeProvider.profileIconBackgroundColor2,
                  appThemeProvider.profileIconBackgroundColor1,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          title: Row(
            children: [
              Text(title, style: TextStyle(color: appThemeProvider.textColor)),
              const SizedBox(width: 8),
              Text(
                subtitle,
                style: TextStyle(color: appThemeProvider.profileSubtitleColor,fontSize: 12),
              ),
            ],
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              color: appThemeProvider.profileArrowColor, size: 16),
          onTap: onTap,
        );
      },
    );
  }
}
