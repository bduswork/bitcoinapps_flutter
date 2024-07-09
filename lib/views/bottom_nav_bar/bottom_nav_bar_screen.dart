import 'package:btcapp/common/custom_nav_icon_widget.dart';
import 'package:btcapp/providers/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //context.read<BottomNavBarProvider>().selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        body: Consumer2<BottomNavBarProvider, AppThemeProvider>(
          builder: (context, bottomNavBarProvider, appThemeProvider, _) {
            return bottomNavBarProvider.getSelectedScreen();
          },
        ),
        bottomNavigationBar: Consumer2<BottomNavBarProvider, AppThemeProvider>(
          builder: (context, bottomNavBarProvider, appThemeProvider, _) {
            return Container(
              decoration: BoxDecoration(
                color: appThemeProvider.backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(bottomNavBarBorderRadius),
                  topRight: Radius.circular(bottomNavBarBorderRadius),
                ),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                    colors: [appThemeProvider.bottomNavigationBarBorderGradientColor1, appThemeProvider.bottomNavigationBarBorderGradientColor2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter
                  ),
                  width: 2.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(bottomNavBarBorderRadius),
                  topRight: Radius.circular(bottomNavBarBorderRadius),
                ),

                child: BottomNavigationBar(
                  elevation: 0.0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  backgroundColor: appThemeProvider.bottomNavigationBarColor,
                  
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: const CustomNavIconWidget(navIconImage: homeIcon), 
                      activeIcon: CustomNavIconWidget(navIconImage: homeIcon, color: appThemeProvider.bottomNavigationBarActiveIconColor,),
                      label: 'Home'
                    ),
                  
                    BottomNavigationBarItem(
                      icon: const CustomNavIconWidget(navIconImage: learnBitcoinIcon),
                      activeIcon: CustomNavIconWidget(navIconImage: learnBitcoinIcon, color: appThemeProvider.bottomNavigationBarActiveIconColor,),
                      label: 'Learn Bitcoin'
                    ),
                  
                    BottomNavigationBarItem(
                      icon: const CustomNavIconWidget(navIconImage: createDashboardIcon),
                      activeIcon: CustomNavIconWidget(navIconImage: createDashboardIcon, color: appThemeProvider.bottomNavigationBarActiveIconColor,),
                      label: 'Create Dashboard'
                    ),
                  
                    BottomNavigationBarItem(
                      icon: const CustomNavIconWidget(navIconImage: profileIcon),
                      activeIcon: CustomNavIconWidget(navIconImage: profileIcon, color: appThemeProvider.bottomNavigationBarActiveIconColor,),
                      label: 'Profile'
                    ),
                  
                  ],
                  currentIndex: bottomNavBarProvider.selectedIndex,
                  onTap: (index) {
                    bottomNavBarProvider.selectedIndex = index;
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}