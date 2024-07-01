import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/common/custom_text_field.dart';
import 'package:btcapp/providers/auth/otp_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/painters/background_painter.dart';
import 'package:btcapp/views/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);

  @override
  _NewPasswordViewState createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmpasswordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordCtrl.dispose();
    confirmpasswordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer2<AppThemeProvider, OtpProvider>(
          builder: (context, appThemeProvider, otpProvider, _) {
            return Stack(
              children: [
                CustomPaint(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height,
                  ),
                  painter: BackgroundPainter(),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Reset your password',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'At least 8 characters, with uppercase and lowercase letters',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 32),
                          CustomTextField(
                            title: "Password",
                            controller: passwordCtrl,
                            hintText: "Password",
                            obscureText: !otpProvider.isPasswordVisible,
                            suffixIcon: InkWell(
                              child: Icon(
                                otpProvider.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: appThemeProvider.textColor,
                                size: 20,
                              ),
                              onTap: () {
                                setState(() {
                                  otpProvider.togglePasswordVisibility();
                                });
                              },
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password is required";
                              } else if (!otpProvider
                                  .isPasswordCompliant(value)) {
                                return "Password must be at least 8 characters long and contain uppercase and lowercase letters.";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 16),
                          CustomTextField(
                            title: "Confirm Password",
                            controller: confirmpasswordCtrl,
                            hintText: "Confirm Password",
                            obscureText: !otpProvider.isPasswordVisible,
                            suffixIcon: InkWell(
                              child: Icon(
                                otpProvider.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: appThemeProvider.textColor,
                                size: 20,
                              ),
                              onTap: () {
                                setState(() {
                                  otpProvider.togglePasswordVisibility();
                                });
                              },
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Confirm Password is required";
                              } else if (value != passwordCtrl.text) {
                                return "Passwords do not match";
                              }
                              return null;
                            },
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: 32),
                          CustomRectangleButton(
                            title: 'Save',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignInView(),
                                ));
                              }
                            },
                            isPrimary: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
