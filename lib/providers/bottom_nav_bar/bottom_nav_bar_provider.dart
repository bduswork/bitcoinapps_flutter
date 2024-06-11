
import 'package:btcapp/views/create_dashboard/create_dashboard_screen.dart';
import 'package:btcapp/views/dashboard/dashboard_screen.dart';
import 'package:btcapp/views/learn_bitcoin/learn_bitcoin_screen.dart';
import 'package:btcapp/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Widget getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const DashboardScreen();
      case 1:
        return const LearnBitcoinScreen();
      case 2:
        return const CreateDashboardScreen();
      case 3:
        return const ProfileScreen();
      default:
        return Container();
    }
  }
}