import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateDashboardScreen extends StatefulWidget {
  const CreateDashboardScreen({super.key});

  @override
  State<CreateDashboardScreen> createState() => _CreateDashboardScreenState();
}

class _CreateDashboardScreenState extends State<CreateDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Center(
              child: Text("Create Dashboard Screen", style: TextStyle(color: appThemeProvider.textColor),),
            );
          },
        )
      ),
    );
  }
}