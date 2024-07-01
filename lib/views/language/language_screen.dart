import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_lang_button.dart';
import 'package:btcapp/common/custom_rectangle_button.dart';
import 'package:btcapp/common/custom_rounder_button.dart';
import 'package:btcapp/common/custom_social_button.dart';
import 'package:btcapp/common/custom_text_field.dart';
import 'package:btcapp/providers/language/language_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:btcapp/utils/constants/size_constant.dart';
import 'package:btcapp/utils/dialog_helper/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  TextEditingController txtExampleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer2<LanguageProvider, AppThemeProvider>(
        builder: (context, langProvider, appThemeProvider, _) {
          return AppBackground(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: veriticalPadding),
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50,),
            
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      icon: Icon(Icons.arrow_back_ios, color: appThemeProvider.textColor)
                    ),
            
                    const SizedBox(height: 50,),
                    
                    CustomLangButton(
                      title: "English",
                      trailingIcon: Icon(langProvider.currLang =="en"? Icons.circle : Icons.circle_outlined, color: appThemeProvider.textColor),
                      onTap: () {
                        langProvider.changeLanguage(const Locale('en'));
                      },
                    ),
                    
                    const SizedBox(height: 20,),
            
                    CustomLangButton(
                      title: "Spanish",
                      trailingIcon: Icon(langProvider.currLang =="en"? Icons.circle_outlined : Icons.circle, color: appThemeProvider.textColor),
                      onTap: () {
                        langProvider.changeLanguage(const Locale('es'));
                      },
                    ),
            
            
            
                    const SizedBox(height: 100,),
            
                    CustomRoundedButton(
                      title: "Custom Rounded Secondary Button", 
                      onPressed: () {
                        
                      }, 
                      isPrimary: false
                    ),
                    const SizedBox(height: 10,),
                    CustomRoundedButton(
                      title: "Custom Rounded Primary Button", 
                      onPressed: () {
                        
                      }, 
                      isPrimary: true
                    ),
            
            
                    const SizedBox(height: 30,),
            
                    CustomRectangleButton(
                      title: "Custom Rectangle Secondary Button", 
                      onPressed: () {
                        
                      }, 
                      isPrimary: false
                    ),
                    const SizedBox(height: 10,),
                    CustomRectangleButton(
                      title: "Custom Rectangle Primary Button", 
                      onPressed: () {
                        
                      }, 
                      isPrimary: true
                    ),
                    const SizedBox(height: 30,),

                    CustomTextField(
                      title: "Email",
                      controller: txtExampleCtrl,
                      hintText: "Email",
                      prefixIcon: Image.asset(emailIcon),
                      //suffixIcon: Image.asset(obscureIcon),
                    ),

                    const SizedBox(height: 30,),

                    CustomSocialButton(
                      imageUrl: googleIcon, 
                      backgroundColor: const Color.fromARGB(255, 209, 174, 174),
                      onPressed: () {
                        
                      },
                    ),

                    const SizedBox(height: 30,),

                    CustomRoundedButton(
                      title: "Custom Dialog", 
                      onPressed: () {
                        DialogHelper().showCustomDialogBox(context, content: 'This is the content of the dialog.');
                      }, 
                      isPrimary: true
                    ),

                    const SizedBox(height: 30,),
            
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}