import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/views/auth/otp_screen.dart';
import 'package:btcapp/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResetScreenView extends StatefulWidget {
  const ResetScreenView({super.key});

  @override
  State<ResetScreenView> createState() => _ResetScreenViewState();
}

class _ResetScreenViewState extends State<ResetScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        logoimage,
                        width: 300,
                        height: 300,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'OTP Authentication',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: appThemeProvider.textColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'An authentication code will be sent to\n(+88) 0123 456 XXXX',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: appThemeProvider.textColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomRectangleButton(
                        title: 'Get OTP',
                        onPressed: () {
                          // Navigate to OtpView
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const OtpView(),
                          ));
                        },
                        isPrimary: true,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: TextStyle(color: appThemeProvider.textColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignupView(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color: appThemeProvider.textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
