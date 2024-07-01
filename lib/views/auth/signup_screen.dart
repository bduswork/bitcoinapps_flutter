import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/common/custom_text_field.dart';
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
    return Scaffold(
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
                        //prefixIcon: Image.asset(emailIcon),
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
                        //prefixIcon: Image.asset(emailIcon),
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
                        //prefixIcon: Image.asset(emailIcon),
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
                        //prefixIcon: Image.asset(emailIcon),
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
                            print("signup");
                            await signupProvider.registerUser(
                              "${nameCtrl.text} ${surnameCtrl.text}",
                              emailCtrl.text,
                              emailCtrl.text,
                              passwordCtrl.text,
                            );

                            if (signupProvider.status == "success") {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignInView(),
                              ));
                            }
                          }

                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) => const SignInView(),
                          // ));
                        },
                        isPrimary: true,
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
    );
  }
}
