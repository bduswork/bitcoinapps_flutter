import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode autovalidateMode;
  final bool? readOnly;
  final TextInputType? textInputType;

  const CustomTextField({
    super.key,
    this.title = "",
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.readOnly = false,
    this.textInputType = TextInputType.name
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title!.isEmpty? Container() : Text(title!, style: TextStyle(color: appThemeProvider.customTextFieldTitleTextColor),),
            SizedBox(height: title!.isEmpty? 0 : 8,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                gradient: LinearGradient(
                  colors: [appThemeProvider.customTextFieldBorderGradientColor1, appThemeProvider.customTextFieldBorderGradientColor2],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                ),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  prefixIcon != null? SizedBox(
                    height: 20,
                    width: 20,
                    child: prefixIcon,
                  ): Container(),
                  prefixIcon != null? const SizedBox(width: 10,) : Container(),
        
                  Expanded(
                    child: TextFormField(
                      controller: controller,
                      obscureText: obscureText!,
                      autovalidateMode: autovalidateMode,
                      keyboardType: textInputType,
                      readOnly: readOnly!,
                      validator: validator,
                      onChanged: onChanged ?? (value) {},
                      cursorColor: appThemeProvider.customTextFieldTextColor,
                      style: TextStyle(color: appThemeProvider.customTextFieldTextColor),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(color: appThemeProvider.customTextFieldHintTextColor),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
        
                  suffixIcon != null? const SizedBox(width: 10,) : Container(),
                  suffixIcon != null? SizedBox(
                    height: 20,
                    width: 20,
                    child: suffixIcon,
                  ) : Container(),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
