import 'package:btcapp/common/custom_info_button.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CustomDialogBox extends StatefulWidget {
  final String? title;
  final String content;
  const CustomDialogBox({super.key, this.title, required this.content});

  @override
  State<CustomDialogBox> createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(customDialogBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(customDialogBorderRadius),
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Container(
              color: appThemeProvider.dialogBgColor,
              width: double.infinity,
              padding: const EdgeInsets.all(customDialogPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //const CustomInfoButton(size: 28,),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset(
                          closeIcon,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(appThemeProvider.dialogCloseIconColor, BlendMode.srcIn),
                        ),
                      )
                    ],
                  ),
                  const CustomInfoButton(size: 28,),
                  const SizedBox(height: 20.0),
                  widget.title != null? Text(
                    widget.title!,
                    style: TextStyle(color: appThemeProvider.dialogTextColor, fontSize: 24.0, fontWeight: FontWeight.bold),
                  ): Container(),
                  SizedBox(height: widget.title !=null? 16.0:0.0),
                  Text(
                    widget.content,
                    style: TextStyle(color: appThemeProvider.dialogTextColor, fontSize: 16.0),
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}