import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:btcapp/views/auth/signin_screen.dart';
import 'package:btcapp/views/auth/signup_screen.dart';
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
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: veriticalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      welcomeimage,
                      height: 200,
                      width: 200,
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
                    const SizedBox(height: 200),
                    CustomRectangleButton(
                      title: 'Create an Account',
                      onPressed: () {
                        // Navigate to another screen (replace with your navigation logic)
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
                        // Navigate to another screen (replace with your navigation logic)
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignInView(),
                        ));
                      },
                      isPrimary: false,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
