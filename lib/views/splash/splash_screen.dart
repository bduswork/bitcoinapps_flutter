import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/views/onboarding/onboarding_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:btcapp/common/app_background.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const OnboardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(logoimage,
                      width: 300, height: 300),
                  const SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context)!.splash_title,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: appThemeProvider.textColor,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: 40,
                        color: appThemeProvider.textColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          AppLocalizations.of(context)!.splash_subtitle,
                          style: TextStyle(
                            fontSize: 10,
                            color: appThemeProvider.textColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: 40,
                        color: appThemeProvider.textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        appThemeProvider.textColor),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
