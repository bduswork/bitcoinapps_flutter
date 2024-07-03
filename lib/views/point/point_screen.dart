import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({super.key});

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<AppThemeProvider>(context).backgroundColor,
        title: Text(
          'Points',
          style: TextStyle(
              color: Provider.of<AppThemeProvider>(context).textColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Provider.of<AppThemeProvider>(context).textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AppBackground(child: Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return Center(
            child: Text(
              "Points",
              style: TextStyle(color: appThemeProvider.textColor, fontSize: 30),
            ),
          );
        },
      )),
    );
  }
}
