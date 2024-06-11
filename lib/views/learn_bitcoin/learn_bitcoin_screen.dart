import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LearnBitcoinScreen extends StatefulWidget {
  const LearnBitcoinScreen({super.key});

  @override
  State<LearnBitcoinScreen> createState() => _LearnBitcoinScreenState();
}

class _LearnBitcoinScreenState extends State<LearnBitcoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Center(
              child: Text("Learn Bitcoin Screen", style: TextStyle(color: appThemeProvider.textColor),),
            );
          },
        )
      ),
    );
  }
}