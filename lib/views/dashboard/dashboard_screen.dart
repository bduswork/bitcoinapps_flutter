import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_info_button.dart';
import 'package:btcapp/common/custom_line_chart.dart';
import 'package:btcapp/providers/block_provider/block_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:btcapp/utils/dialog_helper/dialog_helper.dart';
import 'package:btcapp/utils/painters/block_painter.dart';
import 'package:btcapp/views/blocks_details/live_price_details_screen.dart';
import 'package:btcapp/views/drawer/app_drawer_screen.dart';
import 'package:btcapp/views/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int gridItemLength = 5;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BlockProvider>().fetchPublicGeneralBlocks();
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const AppDrawer(),
      body: AppBackground(
        child: SingleChildScrollView(
          child: Consumer2<AppThemeProvider, BlockProvider>(
              builder: (context, appThemeProvider, blockProvider,_) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: veriticalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
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
                              child: Image.asset(appThemeProvider.isDarkMode
                                  ? appDrawerIconDark
                                  : appDrawerIconLight),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: Text(
                              AppLocalizations.of(context)!.app_title,
                              style: TextStyle(
                                  color: appThemeProvider.textColor,
                                  fontSize: 20,
                                  fontFamily: 'PetitFormalScript',
                                  fontWeight: FontWeight.w400),
                            ),
                          )),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: double.infinity,
                              width: 44,
                              alignment: Alignment.center,
                              child: Image.asset(appThemeProvider.isDarkMode
                                  ? appNotificationIconDark
                                  : appNotificationIconLight),
                            ),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),

                  //Expanded Block
                  Skeletonizer(
                    enabled: blockProvider.isLoading,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                const LivePriceDetailsScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 180,
                        decoration: BoxDecoration(
                          border: GradientBoxBorder(
                            gradient: LinearGradient(
                              colors: [
                                appThemeProvider.blockBorderColorTop,
                                appThemeProvider.blockBorderColorBottom,
                                appThemeProvider.blockBorderColorBottom
                              ],
                              begin: Alignment.topCenter, // Start the gradient at the top
                              end: Alignment.bottomCenter, // End the gradient at the bottom
                            ),
                            width: blockBorderStrokeWidthForFullBlock,
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 180,
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        blockProvider.blockModel?.data[0].subMenuName?? "Block Name",
                                        style: TextStyle(
                                          color: appThemeProvider.textColor,
                                          fontSize: 14),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 1,
                                      ),
                                      Text(
                                        blockProvider.isLoading? "Live Price" : (blockProvider.blockModel?.data[0].price == null? "" : blockProvider.blockModel!.data[0].price.toString()),
                                        style: TextStyle(
                                            color: appThemeProvider.textColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        DialogHelper().showCustomDialogBox(context, title: blockProvider.blockModel?.data[0].subMenuName?? "Block Name", content: "Lorem Ipsum is a placeholder text that designers and developers use to fill the space of a website or document with dummy content when the actual content is not yet available. The text has been used since the 16th century and is derived from a Latin text by Cicero.");
                                      },
                                      child: const CustomInfoButton(size: 22,)
                                    ),
                                    SvgPicture.asset(
                                      threeDotHorizontalIcon,
                                      width: 22,
                                      height: 22,
                                      colorFilter: ColorFilter.mode(appThemeProvider.threeDotIconBgColor, BlendMode.srcIn),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    child: 
                    // blockProvider.isLoading? 
                    // Center(child: CircularProgressIndicator(
                    //   color: appThemeProvider.textColor
                    // )) : 
                    blockProvider.errorMessage.isNotEmpty
                      ? Center(child: Text(blockProvider.errorMessage))
                      : Skeletonizer(
                        enabled: blockProvider.isLoading,
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1.1),
                          itemCount: blockProvider.blockModel?.data.length?? 10,
                          itemBuilder: (BuildContext context, int index) {
                          index++;
                          bool isLeftBlock = index % 2 != 0;
                          int totalLength = blockProvider.blockModel?.data.length?? 10;
                          if (index < totalLength) {
                            return InkWell(
                              onDoubleTap: () {
                                blockProvider.swapBlocks(index);
                              },
                              child: CustomPaint(
                                painter: BlockPainter(
                                  isEmptyAndLightModeBlock: false,
                                  borderStrokeWidth: blockBorderStrokeWidthForFullBlock,
                                  bgColor: appThemeProvider.blockBackgroundColor,
                                  linearGradient: LinearGradient(
                                    colors: isLeftBlock
                                        ? [
                                            appThemeProvider.blockBorderColorTop,
                                            appThemeProvider.blockBorderColorBottom,
                                            appThemeProvider.blockBorderColorBottom
                                          ]
                                        : [
                                            appThemeProvider.blockGridRightBorderColorTop,
                                            appThemeProvider.blockGridRightBorderColorBottom,
                                            appThemeProvider.blockGridRightBorderColorBottom
                                          ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: 16, right: 16, left: 12, bottom: 12),
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              blockProvider.blockModel?.data[index].subMenuName?? "Block Name",
                                              style: TextStyle(
                                                  color: appThemeProvider.textColor,
                                                  fontSize: 14),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: 1,
                                            ),
                                            Text(
                                              blockProvider.isLoading? "Live Price" : (blockProvider.blockModel?.data[index].price == null? "" : blockProvider.blockModel!.data[index].price.toString()),
                                              style: TextStyle(
                                                  color: appThemeProvider.textColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),

                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Container()
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: !blockProvider.isLoading? Container(
                                                  height: double.infinity,
                                                  alignment: Alignment.center,
                                                  child: CustomLineChart(
                                                    cdata: blockProvider.getChartData(),
                                                    lineColor: isLeftBlock? Colors.red :Colors.greenAccent,
                                                    lineWidth: 3,
                                                  ),
                                                ) : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // Expanded(
                                      //   child: Container(
                                      //     alignment: Alignment.center,
                                      //     child: CustomLineChart(
                                      //       cdata: blockProvider.getChartData(),
                                      //       lineColor: isLeftBlock? Colors.red :Colors.greenAccent ,
                                      //       lineWidth: 3,
                                      //     ),
                                      //   ),
                                      // ),
                                                        
                                      Container(
                                        width: double.infinity,
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                DialogHelper().showCustomDialogBox(context, title: blockProvider.blockModel?.data[index].subMenuName?? "Block Name", content: "Lorem Ipsum is a placeholder text that designers and developers use to fill the space of a website or document with dummy content when the actual content is not yet available. The text has been used since the 16th century and is derived from a Latin text by Cicero.");
                                              },
                                              child: const CustomInfoButton(size: 22,)
                                            ),
                                            SvgPicture.asset(
                                              threeDotHorizontalIcon,
                                              width: 22,
                                              height: 22,
                                              colorFilter: ColorFilter.mode(appThemeProvider.threeDotIconBgColor, BlendMode.srcIn),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return CustomPaint(
                              painter: BlockPainter(
                                isEmptyAndLightModeBlock: appThemeProvider.isDarkMode ? false : true,
                                borderStrokeWidth: blockBorderStrokeWidthForEmptyBlock,
                                bgColor: appThemeProvider.blockBackgroundColor,
                                linearGradient: LinearGradient(
                                  colors: isLeftBlock
                                      ? [
                                          appThemeProvider.blockBorderColorTop,
                                          appThemeProvider.blockBorderColorBottom,
                                          appThemeProvider.blockBorderColorBottom
                                        ]
                                      : [
                                          appThemeProvider.blockGridRightBorderColorTop,
                                          appThemeProvider.blockGridRightBorderColorBottom,
                                          appThemeProvider.blockGridRightBorderColorBottom
                                        ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                child: Icon(Icons.add,
                                    size: 40,
                                    color: appThemeProvider.blockEmptyIconColor),
                              ),
                            );
                          }
                        },
                                            ),
                      ),
                  ),

                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.all(0),
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 20,
                  //           mainAxisSpacing: 20,
                  //           childAspectRatio: 1.1),
                  //   itemCount: blockProvider.blockModel!.data.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     bool isLeftContainer = index % 2 == 0;
                  //     if (index < gridItemLength - 1) {
                  //       return CustomPaint(
                  //         painter: BlockPainter(
                  //           isEmptyAndLightModeBlock: false,
                  //           borderStrokeWidth:
                  //               blockBorderStrokeWidthForFullBlock,
                  //           bgColor: appThemeProvider.blockBackgroundColor,
                  //           linearGradient: LinearGradient(
                  //             colors: isLeftContainer
                  //                 ? [
                  //                     appThemeProvider.blockBorderColorTop,
                  //                     appThemeProvider.blockBorderColorBottom,
                  //                     appThemeProvider.blockBorderColorBottom
                  //                   ]
                  //                 : [
                  //                     appThemeProvider.blockGridRightBorderColorTop,
                  //                     appThemeProvider.blockGridRightBorderColorBottom,
                  //                     appThemeProvider.blockGridRightBorderColorBottom
                  //                   ],
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //           ),
                  //         ),
                  //         child: Container(
                  //           padding: const EdgeInsets.only(
                  //               top: 16, right: 16, left: 12, bottom: 12),
                  //           alignment: Alignment.topLeft,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 blockProvider.blockModel!.data[index].subMenuName,
                  //                 style: TextStyle(
                  //                     color: appThemeProvider.textColor,
                  //                     fontSize: 14),
                  //               ),
                  //               const SizedBox(
                  //                 height: 2,
                  //               ),
                  //               Text(
                  //                 "18.362K",
                  //                 style: TextStyle(
                  //                     color: appThemeProvider.textColor,
                  //                     fontSize: 24,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return CustomPaint(
                  //         painter: BlockPainter(
                  //           isEmptyAndLightModeBlock:
                  //               appThemeProvider.isDarkMode ? false : true,
                  //           borderStrokeWidth:
                  //               blockBorderStrokeWidthForEmptyBlock,
                  //           bgColor: appThemeProvider.blockBackgroundColor,
                  //           linearGradient: LinearGradient(
                  //             colors: isLeftContainer
                  //                 ? [
                  //                     appThemeProvider.blockBorderColorTop,
                  //                     appThemeProvider.blockBorderColorBottom,
                  //                     appThemeProvider.blockBorderColorBottom
                  //                   ]
                  //                 : [
                  //                     appThemeProvider.blockGridRightBorderColorTop,
                  //                     appThemeProvider.blockGridRightBorderColorBottom,
                  //                     appThemeProvider.blockGridRightBorderColorBottom
                  //                   ],
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //           ),
                  //         ),
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           child: Icon(Icons.add,
                  //               size: 40,
                  //               color: appThemeProvider.blockEmptyIconColor),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),




                  // Expanded Block
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) =>
                  //             const LivePriceDetailsScreen(),
                  //       ),
                  //     );
                  //   },
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 180,
                  //     decoration: BoxDecoration(
                  //       border: GradientBoxBorder(
                  //         gradient: LinearGradient(
                  //           colors: [
                  //             appThemeProvider.blockBorderColorTop,
                  //             appThemeProvider.blockBorderColorBottom,
                  //             appThemeProvider.blockBorderColorBottom
                  //           ],
                  //           begin: Alignment.topCenter, // Start the gradient at the top
                  //           end: Alignment.bottomCenter, // End the gradient at the bottom
                  //         ),
                  //         width: blockBorderStrokeWidthForFullBlock,
                  //       ),
                  //       borderRadius: BorderRadius.circular(20)
                  //     ),
                  //     child: Container(
                  //       padding: const EdgeInsets.all(10),
                  //       height: 180,
                  //       width: double.infinity,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Expanded(
                  //             child: Container(
                  //               width: double.infinity,
                  //               alignment: Alignment.topLeft,
                  //               child: Text(
                  //                 "Bitoin VS Gold",
                  //                 style: TextStyle(
                  //                     color: appThemeProvider.textColor,
                  //                     fontSize: 24,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             width: double.infinity,
                  //             alignment: Alignment.centerLeft,
                  //             child: Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 const CustomInfoButton(size: 28,),
                  //                 SvgPicture.asset(
                  //                   threeDotHorizontalIcon,
                  //                   width: 24,
                  //                   height: 24,
                  //                   colorFilter: ColorFilter.mode(appThemeProvider.threeDotIconBgColor, BlendMode.srcIn),
                  //                 )
                  //               ],
                  //             ),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  // GridView.builder(
                  //   shrinkWrap: true,
                  //   padding: const EdgeInsets.all(0),
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 20,
                  //           mainAxisSpacing: 20,
                  //           childAspectRatio: 1.1),
                  //   itemCount: gridItemLength,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     bool isLeftContainer = index % 2 == 0;
                  //     if (index < gridItemLength - 2) {
                  //       return CustomPaint(
                  //         painter: BlockPainter(
                  //           isEmptyAndLightModeBlock: false,
                  //           borderStrokeWidth:
                  //               blockBorderStrokeWidthForFullBlock,
                  //           bgColor: appThemeProvider.blockBackgroundColor,
                  //           linearGradient: LinearGradient(
                  //             colors: isLeftContainer
                  //                 ? [
                  //                     appThemeProvider.blockBorderColorTop,
                  //                     appThemeProvider.blockBorderColorBottom,
                  //                     appThemeProvider.blockBorderColorBottom
                  //                   ]
                  //                 : [
                  //                     appThemeProvider.blockGridRightBorderColorTop,
                  //                     appThemeProvider.blockGridRightBorderColorBottom,
                  //                     appThemeProvider.blockGridRightBorderColorBottom
                  //                   ],
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //           ),
                  //         ),
                  //         child: Container(
                  //           padding: const EdgeInsets.only(
                  //               top: 16, right: 16, left: 12, bottom: 12),
                  //           alignment: Alignment.topLeft,
                  //           child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               Text(
                  //                 "Live Price",
                  //                 style: TextStyle(
                  //                     color: appThemeProvider.textColor,
                  //                     fontSize: 14),
                  //               ),
                  //               const SizedBox(
                  //                 height: 2,
                  //               ),
                  //               Text(
                  //                 "18.362K",
                  //                 style: TextStyle(
                  //                     color: appThemeProvider.textColor,
                  //                     fontSize: 24,
                  //                     fontWeight: FontWeight.bold),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       );
                  //     } else {
                  //       return CustomPaint(
                  //         painter: BlockPainter(
                  //           isEmptyAndLightModeBlock:
                  //               appThemeProvider.isDarkMode ? false : true,
                  //           borderStrokeWidth:
                  //               blockBorderStrokeWidthForEmptyBlock,
                  //           bgColor: appThemeProvider.blockBackgroundColor,
                  //           linearGradient: LinearGradient(
                  //             colors: isLeftContainer
                  //                 ? [
                  //                     appThemeProvider.blockBorderColorTop,
                  //                     appThemeProvider.blockBorderColorBottom,
                  //                     appThemeProvider.blockBorderColorBottom
                  //                   ]
                  //                 : [
                  //                     appThemeProvider.blockGridRightBorderColorTop,
                  //                     appThemeProvider.blockGridRightBorderColorBottom,
                  //                     appThemeProvider.blockGridRightBorderColorBottom
                  //                   ],
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //           ),
                  //         ),
                  //         child: Container(
                  //           alignment: Alignment.center,
                  //           child: Icon(Icons.add,
                  //               size: 40,
                  //               color: appThemeProvider.blockEmptyIconColor),
                  //         ),
                  //       );
                  //     }
                  //   },
                  // ),
                  const SizedBox(
                    height: bottomNavBarHeight + 20,
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
