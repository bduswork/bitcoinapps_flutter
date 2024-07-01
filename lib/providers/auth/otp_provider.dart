import 'package:flutter/material.dart';

class OtpProvider extends ChangeNotifier{
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

    // Function to validate password format
  bool isPasswordCompliant(String password) {
    if (password.length < 8) {
      return false;
    }
    String pattern = r'^(?=.*[a-z])(?=.*[A-Z])';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }
}