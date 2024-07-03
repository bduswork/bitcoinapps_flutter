import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:btcapp/views/auth/signin_screen.dart';
import 'package:btcapp/views/auth/signup_screen.dart';
import 'package:btcapp/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: veriticalPadding,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Image.asset(
                        welcomeimage,
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Welcome to Bitcoin Canvas',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: appThemeProvider.textColor,
                          fontSize: 30,
                          height: 1.1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Track, Visualize, Learn Bitcoin. It\'s That Easy',
                        style: TextStyle(
                          color: appThemeProvider.textColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2),
                      CustomRectangleButton(
                        title: 'Create an Account',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignupView(),
                          ));
                        },
                        isPrimary: true,
                      ),
                      const SizedBox(height: 10),
                      CustomRectangleButton(
                        title: 'Log In',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ));
                        },
                        isPrimary: false,
                      ),
                      const SizedBox(height: 10),
                      CustomRectangleButton(
                        title: 'Continue as Guest',
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomNavBarScreen(),
                          ));
                        },
                        isPrimary: false,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
