import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/painters/background_painter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppBackground extends StatefulWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  State<AppBackground> createState() => _AppBackgroundState();
}

class _AppBackgroundState extends State<AppBackground> {
  
  @override
  Widget build(BuildContext context) {
    final appThemeProvider = Provider.of<AppThemeProvider>(context);
    return appThemeProvider.isDarkMode?
    Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, double.infinity),
          painter: BackgroundPainter(),
        ),

        widget.child
      ],
    )
    : Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: appThemeProvider.backgroundColor,
        ),

        widget.child
      ],
    );
  }
}