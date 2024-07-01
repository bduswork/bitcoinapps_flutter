import 'package:btcapp/common/app_background.dart';
import 'package:btcapp/providers/theme/app_theme_provider.dart';
import 'package:btcapp/utils/constants/image_constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Provider.of<AppThemeProvider>(context).backgroundColor,
        title: Text(
          'Notification',
          style: TextStyle(
              color: Provider.of<AppThemeProvider>(context).textColor),
        ),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Provider.of<AppThemeProvider>(context).textColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AppBackground(
        child: Consumer<AppThemeProvider>(
          builder: (context, appThemeProvider, _) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                // gradient: LinearGradient(
                //   colors: [Color(0xFF141E30), Color(0xFF243B55)],
                //   begin: Alignment.topLeft,
                //   end: Alignment.bottomRight,
                // ),
              ),
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.transparent,
                    elevation: 0,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                          color: appThemeProvider.notificationsBorderColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage(
                              profileAvatar), // Replace with your asset image
                        ),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Mrs HODL',
                                style: TextStyle(
                                  color: appThemeProvider.textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(text: " "),
                              TextSpan(
                                text:
                                    'has sent you ETH 0.015. Check transaction details here.',
                                style: TextStyle(
                                  color: appThemeProvider.textColor
                                      .withOpacity(0.8),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              const TextSpan(text: " "),
                              TextSpan(
                                text:
                                    'Mar 23', // Replace with dynamic time if needed
                                style: TextStyle(
                                    fontSize: 12,
                                    color: appThemeProvider.textColor
                                        .withOpacity(0.4),
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
