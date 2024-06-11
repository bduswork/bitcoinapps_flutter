import 'package:btcapp/providers/bottom_nav_bar/bottom_nav_bar_provider.dart';
import 'package:btcapp/providers/language/language_provider.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/views/bottom_nav_bar/bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeProvider>(
      builder: (context, appThemeProvider, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Bitcoin Canvas',

          locale: context.watch<LanguageProvider>().appLocale,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('en'), // English
            Locale('es'), // Spanish
          ],

          theme: ThemeData(
            primaryColor: appThemeProvider.primaryColor,
            drawerTheme: DrawerThemeData(
              backgroundColor: appThemeProvider.primaryColor
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: appThemeProvider.primaryColor),
            useMaterial3: true,
          ),
          home: const BottomNavBarScreen(),
        );
      },
    );
  }
}