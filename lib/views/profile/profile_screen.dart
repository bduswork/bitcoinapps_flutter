import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/common/custom_profile_items.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<AppThemeProvider>(context).backgroundColor,
        title: Text('Profile',
            style: TextStyle(
                color: Provider.of<AppThemeProvider>(context).textColor)),
        centerTitle: true,
      ),
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Circular avatar
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profileAvatar),
                  ),
                  const SizedBox(height: 16),
                  // Name in bold text
                  Text(
                    'Samantha Rio',
                    style: TextStyle(
                      color: appThemeProvider.profileTextColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Token number with copy icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'x9dcid0dh22d..btsts',
                        style: TextStyle(
                            color: appThemeProvider.profileSubtitleColor,
                            fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                              const ClipboardData(text: 'x9dcid0dh22d..btsts'));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Token copied to clipboard')),
                          );
                        },
                        child: Icon(
                          Icons.copy,
                          size: 16,
                          color: appThemeProvider.profileCopyIconColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Small paragraph
                  Text(
                    'Crypto enthusiast, NFT creator, animal lover, sumo wrestler & drama queen.',
                    style: TextStyle(
                        color: appThemeProvider.profileTextColor, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Points button
                  TextButton(
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0),
                      backgroundColor: WidgetStateProperty.all(
                          appThemeProvider.profileButtonBackgroundColor),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(
                                color:
                                    appThemeProvider.profileButtonTextColor)),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      '8983 Points',
                      style: TextStyle(
                        color: AppThemeProvider().profileButtonTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),
                  // List of items
                  Expanded(
                    child: ListView(
                      children: [
                        // dark mode switch
                        ListTile(
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  appThemeProvider.profileIconBackgroundColor2,
                                  appThemeProvider.profileIconBackgroundColor1,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ), // Customize the color as needed
                            child: const Icon(Icons.nightlight_round,
                                color: Colors.white),
                          ),
                          title: Text("Dark Mode",
                              style:
                                  TextStyle(color: appThemeProvider.textColor)),
                          trailing: CupertinoSwitch(
                            value: appThemeProvider.isDarkMode,
                            onChanged: (bool value) {
                              appThemeProvider.toggleTheme();
                            },
                          ),
                        ),
                        // currency
                        ListItem(
                          icon: Icons.monetization_on,
                          title: 'Currency',
                          subtitle: 'USD',
                          onTap: () {},
                        ),
                        ListItem(
                          icon: Icons.language,
                          title: 'Language',
                          subtitle: 'English',
                          onTap: () {},
                        ),
                        ListItem(
                          icon: Icons.privacy_tip,
                          title: 'Privacy Policy',
                          subtitle: '',
                          onTap: () {},
                        ),
                        ListItem(
                          icon: Icons.logout,
                          title: 'Logout',
                          subtitle: '',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
