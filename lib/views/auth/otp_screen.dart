import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/views/auth/newpassword_screen.dart';
import 'package:btcapp/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';

class OtpView extends StatefulWidget {
  const OtpView({super.key});

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  final TextEditingController pinController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: context.watch<AppThemeProvider>().textColor,
      ),
      decoration: BoxDecoration(
          border:
              Border.all(color: context.watch<AppThemeProvider>().textColor),
          borderRadius: BorderRadius.circular(10),
          color: context.watch<AppThemeProvider>().pinputBgColor),
    );

    return Scaffold(
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 70),
                    Image.asset(
                      logoimage,
                      width: 250,
                      height: 250,
                    ),
                    const SizedBox(height: 10),
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
                      'An authentication code has been sent to\n(+88) 0123 456 XXXX',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: appThemeProvider.textColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Pinput(
                              controller: pinController,
                              focusNode: focusNode,
                              length: 4,
                              defaultPinTheme: defaultPinTheme,
                              autofocus: true,
                              onCompleted: (pin) {
                                debugPrint('onCompleted: $pin');
                                // Add your logic for completed pin input here
                              },
                              onChanged: (value) {
                                debugPrint('onChanged: $value');
                                // Add your logic for changed pin input here
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    CustomRectangleButton(
                      title: 'Reset Password',
                      onPressed: () {
                        // Validate the form and navigate to the New Password screen
                        if (formKey.currentState!.validate()) {
                          // Check if the pinController text length is exactly 4
                          if (pinController.text.length == 4) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const NewPasswordView(),
                            ));
                          } else {
                            // Show a snackbar or toast indicating the incorrect length
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please enter a 4-digit OTP.'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        }
                      },
                      isPrimary: true,
                    ),
                    const SizedBox(height: 200),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account? ',
                            style: TextStyle(color: appThemeProvider.textColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigate to Sign Up screen
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignupView(),
                              ));
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
