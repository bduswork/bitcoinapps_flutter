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
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Consumer<AppThemeProvider>(
        builder: (context, appThemeProvider, _) {
          return ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                height: 150, // specify the height you want
                width: MediaQuery.of(context).size.width * 0.7,
                color: appThemeProvider.backgroundColor,
                alignment: Alignment.center,
                child: Text(
                  AppLocalizations.of(context)!.app_name,
                  style: TextStyle(
                    color: appThemeProvider.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _buildListTile(
                context,
                index: 0,
                icon: Icons.widgets_outlined,
                title: AppLocalizations.of(context)!.app_drawer_more_blocks,
                appThemeProvider: appThemeProvider,
              ),
              _buildListTile(
                context,
                index: 1,
                icon: Icons.book_outlined,
                title: AppLocalizations.of(context)!.app_drawer_learn_bitcoin,
                appThemeProvider: appThemeProvider,
              ),
              _buildListTile(
                context,
                index: 2,
                icon: Icons.settings_outlined,
                title: AppLocalizations.of(context)!.app_drawer_settings,
                appThemeProvider: appThemeProvider,
              ),
              _buildListTile(
                context,
                index: 3,
                icon: Icons.star_outline,
                title: AppLocalizations.of(context)!.app_drawer_points,
                appThemeProvider: appThemeProvider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 1,
                  width: 40,
                  color: appThemeProvider.textColor,
                ),
              ),
              _buildListTile(
                context,
                index: 4,
                icon: Icons.dashboard_outlined,
                title: AppLocalizations.of(context)!.app_drawer_dashboards,
                appThemeProvider: appThemeProvider,
              ),
              _buildListTile(
                context,
                index: 5,
                icon: Icons.attach_money_outlined,
                title: AppLocalizations.of(context)!.app_drawer_currency,
                appThemeProvider: appThemeProvider,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.dark_mode, color: appThemeProvider.textColor),
                    const SizedBox(width: 20),
                    Text(
                      AppLocalizations.of(context)!.dark_mode,
                      style: TextStyle(
                        color: appThemeProvider.textColor,
                      ),
                    ),
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
              _buildListTile(
                context,
                index: 6,
                icon: Icons.language_outlined,
                title: AppLocalizations.of(context)!.language,
                appThemeProvider: appThemeProvider,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LanguageScreen()));
                },
              ),
              _buildListTile(
                context,
                index: 7,
                icon: Icons.logout,
                title: AppLocalizations.of(context)!.app_drawer_logout,
                appThemeProvider: appThemeProvider,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context, {
    required int index,
    required IconData icon,
    required String title,
    required AppThemeProvider appThemeProvider,
    VoidCallback? onTap,
  }) {
    bool isSelected = _selectedIndex == index;
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected ? Colors.black : appThemeProvider.textColor),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    color:
                        isSelected ? Colors.black : appThemeProvider.textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
