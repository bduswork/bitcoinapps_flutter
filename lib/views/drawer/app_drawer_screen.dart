import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/views/language/language_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width*0.7,
      child: Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: appThemeProvider.backgroundColor,
                ),
                child: Text('', style: TextStyle(color: appThemeProvider.textColor),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(AppLocalizations.of(context)!.dark_mode, style: TextStyle(color: appThemeProvider.textColor, fontSize: 18),),
                    Expanded(child: Container()),
                    CupertinoSwitch(
                      value: appThemeProvider.isDarkMode,
                      onChanged: (bool value) {
                        appThemeProvider.toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
          
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LanguageScreen()));
                },
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.language, style: TextStyle(color: appThemeProvider.textColor, fontSize: 18),),
                      Expanded(child: Container()),
                      Icon(Icons.arrow_forward_ios_outlined, color: appThemeProvider.textColor)
                    ],
                  ),
                ),
              )
              // Add more ListTiles or widgets as needed
            ],
          );
        },
      ),
    );
  }
}
