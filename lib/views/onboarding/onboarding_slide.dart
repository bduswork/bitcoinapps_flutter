import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_gradient_border.dart';
import 'package:btcapp/common/custom_rounder_button.dart';
import 'package:btcapp/enum/border_side_type.dart';
import 'package:btcapp/utils/constants/color_constant.dart';
import 'package:btcapp/utils/local_storage/app_sharedpreference.dart';
import 'package:btcapp/views/learn_bitcoin/learn_bitcoin_screen.dart';
import 'package:btcapp/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final int currentIndex;
  final int pageIndex;
  final PageController pageController;

  const OnboardingSlide({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.currentIndex,
    required this.pageIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Stack(
        children: [
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.all(50.0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Image.asset(imagePath, fit: BoxFit.contain),
                  ),
                ),
                if (currentIndex != 2)
                  Expanded(
                    child: Container(),
                  ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Container(
                  padding: const EdgeInsets.all(50.0),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Container(),
                ),
              ),
              Expanded(
                flex: 5,
                child: CustomGradientBorder(
                  gradient: const LinearGradient(
                    colors: [
                      DarkThemeColors.customButtonBorderGradientColor1,
                      DarkThemeColors.customButtonBorderGradientColor2,
                    ],
                  ),
                  borderWidth: 2.0,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  borderSideTypes: const {
                    BorderSideType.left,
                    BorderSideType.top,
                    BorderSideType.right
                  },
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: DarkThemeColors.blockBackgroundColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                              color: DarkThemeColors.textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            description,
                            style: TextStyle(
                              color:
                                  DarkThemeColors.customTextFieldTitleTextColor,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(3, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: currentIndex == index ? 30 : 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: currentIndex == index
                                      ? DarkThemeColors.customButtonColor
                                      : DarkThemeColors
                                          .customButtonColorSecondary,
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 70),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CustomRoundedButton(
                                  title: currentIndex == 0 ? "No" : "Skip",
                                  onPressed: () {
                                    // Handle button click logic
                                    if (currentIndex == 0) {
                                      pageController.animateToPage(
                                        currentIndex + 1,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    } else {
                                      AppSharedPreferences()
                                          .setIsOnboarded(true);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WelcomeScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  isPrimary: false,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: CustomRoundedButton(
                                  title: currentIndex == 0 ? "Yes" : "Continue",
                                  onPressed: () {
                                    if (currentIndex == 0) {
                                      AppSharedPreferences()
                                          .setIsOnboarded(true);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LearnBitcoinScreen(),
                                        ),
                                      );
                                    } else if (currentIndex < 2) {
                                      pageController.animateToPage(
                                        currentIndex + 1,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        curve: Curves.easeIn,
                                      );
                                    } else if (currentIndex == 2) {
                                      AppSharedPreferences()
                                          .setIsOnboarded(true);
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WelcomeScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  isPrimary: true,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
