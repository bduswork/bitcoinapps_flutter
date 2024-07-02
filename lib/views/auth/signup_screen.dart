import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/common/custom_text_field.dart';
import 'package:btcapp/providers/auth/otp_provider.dart';
import 'package:btcapp/providers/auth/signup_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/views/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController surnameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: AppBackground(
          child: Consumer2<AppThemeProvider, SignupProvider>(
            builder: (context, appThemeProvider, signupProvider, _) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 50),
                        Text(
                          'Create an Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: appThemeProvider.textColor,
                            fontSize: 24,
                            height: 1.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          title: "Name",
                          controller: nameCtrl,
                          hintText: 'Enter your Name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          title: "Surname",
                          controller: surnameCtrl,
                          hintText: 'Enter your surname',
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Surname is required";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          title: "Email",
                          controller: emailCtrl,
                          hintText: 'Enter your email',
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          title: "Password",
                          controller: passwordCtrl,
                          hintText: "Password",
                          obscureText: !signupProvider.isPasswordVisible,
                          suffixIcon: InkWell(
                            child: Icon(
                              signupProvider.isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: appThemeProvider.textColor,
                              size: 20,
                            ),
                            onTap: () {
                              setState(() {
                                signupProvider.togglePasswordVisibility();
                              });
                            },
                          ),
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return "Password is required";
                            } else if (!context
                                .watch<OtpProvider>()
                                .isPasswordCompliant(p0)) {
                              return "Password must be at least 8 characters long and contain uppercase and lowercase letters.";
                            }
                            return null;
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(height: 30),
                        CustomRectangleButton(
                          title: 'Sign Up',
                          isLoading: signupProvider.isLoading,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await signupProvider.registerUser(
                                "${nameCtrl.text} ${surnameCtrl.text}",
                                emailCtrl.text,
                                emailCtrl.text,
                                passwordCtrl.text,
                              );

                              if (signupProvider.status == "success") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(signupProvider.message),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignInView(),
                                ));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(signupProvider.message),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          isPrimary: true,
                        ),
                        const SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account? ',
                                style: TextStyle(
                                    color: appThemeProvider.textColor)),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignInView(),
                                ));
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: appThemeProvider.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
