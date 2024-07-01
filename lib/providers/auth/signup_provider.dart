import 'package:btcapp/service/auth/signup_service.dart';
import 'package:flutter/material.dart';

class SignupProvider extends ChangeNotifier{
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }


  bool _isLoading = false;
  String _message = '';
  String _status = '';

  bool get isLoading => _isLoading;
  String get message => _message;
  String get status => _status;

  Future<void> registerUser(String name, String username, String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await SignupService().registerUser(name, username, email, password);
      _message = response['message'];
      _status = response['status'];
    } catch (e) {
      _message = 'An error occurred';
      _status = 'error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}