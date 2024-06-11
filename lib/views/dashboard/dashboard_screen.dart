import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:btcapp/utils/painters/block_painter.dart';
import 'package:btcapp/views/drawer/app_drawer_screen.dart';
import 'package:btcapp/common/app_background.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int gridItemLength = 5; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Consumer<AppThemeProvider>(
            builder: (context, appThemeProvider, _) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: veriticalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
                    Container(
                      height: 44,
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: Container(
                              height: double.infinity,
                              width: 44,
                              alignment: Alignment.center,
                              child: Image.asset(appThemeProvider.isDarkMode? appDrawerIconDark : appDrawerIconLight),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: Text(AppLocalizations.of(context)!.app_title, 
                                style: TextStyle(
                                  color: appThemeProvider.textColor , 
                                  fontSize: 20, 
                                  fontFamily: 'PetitFormalScript', 
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            )
                          ),
                          Container(
                            height: double.infinity,
                            width: 44,
                            alignment: Alignment.center,
                            child: Image.asset(appThemeProvider.isDarkMode? appNotificationIconDark : appNotificationIconLight),
                          ),
                        ],
                      )
                    ),
                    const SizedBox(height: 20,),
                    CustomPaint(
                      painter: BlockPainter(
                        isEmptyAndLightModeBlock: false,
                        borderStrokeWidth: blockBorderStrokeWidthForFullBlock,
                        bgColor: appThemeProvider.blockBackgroundColor,
                        linearGradient: LinearGradient(
                          colors: [appThemeProvider.blockBorderColorTop, appThemeProvider.blockBorderColorBottom, appThemeProvider.blockBorderColorBottom],
                          begin: Alignment.topCenter, // Start the gradient at the top
                          end: Alignment.bottomCenter, // End the gradient at the bottom
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        height: 180,
                        width: double.infinity,
                        child: Text("Bitoin VS Gold", style: TextStyle(color: appThemeProvider.textColor, fontSize: 24, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(0),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1.1
                      ),
                      itemCount: gridItemLength,
                      itemBuilder: (BuildContext context, int index) {
                        bool isLeftContainer = index % 2 == 0;
                        if(index < gridItemLength-2){
                          return CustomPaint(
                            painter: BlockPainter(
                              isEmptyAndLightModeBlock: false,
                              borderStrokeWidth: blockBorderStrokeWidthForFullBlock,
                              bgColor: appThemeProvider.blockBackgroundColor,
                              linearGradient: LinearGradient(
                                colors: isLeftContainer? [appThemeProvider.blockBorderColorTop, appThemeProvider.blockBorderColorBottom, appThemeProvider.blockBorderColorBottom]
                                : [appThemeProvider.blockGridRightBorderColorTop, appThemeProvider.blockGridRightBorderColorBottom, appThemeProvider.blockGridRightBorderColorBottom],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(top: 16, right: 16, left: 12, bottom: 12),
                              alignment: Alignment.topLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Live Price", style: TextStyle(color: appThemeProvider.textColor, fontSize: 14),),
                                  const SizedBox(height: 2,),
                                  Text("18.362K", 
                                    style: TextStyle( color: appThemeProvider.textColor, fontSize: 24, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }else{
                          return CustomPaint(
                            painter: BlockPainter(
                              isEmptyAndLightModeBlock: appThemeProvider.isDarkMode? false : true,
                              borderStrokeWidth: blockBorderStrokeWidthForEmptyBlock,
                              bgColor: appThemeProvider.blockBackgroundColor,
                              linearGradient: LinearGradient(
                                colors: isLeftContainer? [appThemeProvider.blockBorderColorTop, appThemeProvider.blockBorderColorBottom, appThemeProvider.blockBorderColorBottom]
                                : [appThemeProvider.blockGridRightBorderColorTop, appThemeProvider.blockGridRightBorderColorBottom, appThemeProvider.blockGridRightBorderColorBottom],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.add, size: 40, color: appThemeProvider.blockEmptyIconColor),
                            ),
                          );
                        }
                      },
                    ),

                    const SizedBox(height: bottomNavBarHeight+20,),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}