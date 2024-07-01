import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/common/custom_social_button.dart';
import 'package:btcapp/common/custom_text_field.dart';
import 'package:btcapp/providers/auth/signin_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/views/auth/reset_screen.dart';
import 'package:btcapp/views/auth/signup_screen.dart';
import 'package:btcapp/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  //bool _isPasswordVisible = false;
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: Consumer2<AppThemeProvider, SigninProvider>(
          builder: (context, appThemeProvider, signinProvider, _) {
            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Image.asset(signinimage, width: 300, height: 300),
                      const SizedBox(height: 20),
                      CustomTextField(
                        //title: "Email",
                        controller: emailCtrl,
                        hintText: "Email",
                        prefixIcon: Image.asset(emailIcon),
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        //title: "Password",
                        controller: passwordCtrl,
                        hintText: "Password",
                        prefixIcon: Image.asset(emailIcon),
                        obscureText: !signinProvider.isPasswordVisible,
                        suffixIcon: InkWell(
                          child: Icon(
                            signinProvider.isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: appThemeProvider.textColor,
                            size: 20,
                          ),
                          onTap: () {
                            setState(() {
                              signinProvider.togglePasswordVisibility();
                            });
                          },
                        ),
                      ),
                      // const SizedBox(height: 20),
                      // TextField(
                      //   style: TextStyle(color: appThemeProvider.textColor),
                      //   obscureText: !signinProvider.isPasswordVisible,
                      //   decoration: InputDecoration(
                      //     prefixIcon: const Icon(Icons.lock),
                      //     suffixIcon: IconButton(
                      //       icon: Icon(
                      //         signinProvider.isPasswordVisible
                      //             ? Icons.visibility
                      //             : Icons.visibility_off,
                      //         color: appThemeProvider.textColor,
                      //       ),
                      //       onPressed: () {
                      //         setState(() {
                      //           signinProvider.togglePasswordVisibility();
                      //         });
                      //       },
                      //     ),
                      //     hintText: 'Password',
                      //     hintStyle: TextStyle(color: appThemeProvider.textColor),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10),
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Navigating to another screen
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ResetScreenView(),
                              
                            ));
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: appThemeProvider.textColor),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomRectangleButton(
                        title: 'Sign In',
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   // signinProvider.signIn(
                          //   //   emailCtrl.text,
                          //   //   passwordCtrl.text,
                          //   // );
                          // }
                          //Navigate to another screen (replace with your navigation logic)
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const BottomNavBarScreen(),
                          ));
                        },
                        isPrimary: true,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Or by social accounts',
                        style: TextStyle(color: appThemeProvider.textColor),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSocialButton(
                            imageUrl: facebookIcon,
                            backgroundColor: appThemeProvider.facebookBgColor,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          CustomSocialButton(
                            imageUrl: googleIcon,
                            backgroundColor: appThemeProvider.googleBgColor,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          CustomSocialButton(
                            imageUrl: appleIcon,
                            backgroundColor: appThemeProvider.appleBgColor,
                            onPressed: () {},
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.markunread_outlined,
                          //       color: Colors.red, size: 40),
                          //   onPressed: () {
                          //     // Google login logic here
                          //   },
                          // ),
                          // IconButton(
                          //   icon: const Icon(Icons.apple_sharp,
                          //       color: Colors.black, size: 40),
                          //   onPressed: () {
                          //     // Apple login logic here
                          //   },
                          // ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account? ',
                              style:
                                  TextStyle(color: appThemeProvider.textColor)),
                          GestureDetector(
                            onTap: () {
                              // Navigating to another screen
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
