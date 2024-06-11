import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Center(
              child: Text("Home Screen", style: TextStyle(color: appThemeProvider.textColor),),
            );
          },
        )
      ),
    );
  }
}