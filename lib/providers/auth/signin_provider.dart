
import 'package:btcapp/model/usermodel/user_login_failed_model.dart';
import 'package:btcapp/model/usermodel/user_model.dart';
import 'package:btcapp/service/auth/auth_service.dart';
import 'package:btcapp/utils/local_storage/app_sharedpreference.dart';
import 'package:flutter/material.dart';

class SigninProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  bool _isLoading = false;
  String _message = '';
  String _status = '';
  UserModel? _userModel;
  UserLoginFailedModel? _userLoginFailedModel;

  bool get isLoading => _isLoading;
  String get message => _message;
  String get status => _status;
  UserModel? get userModel => _userModel;
  UserLoginFailedModel? get userLoginFailedModel => _userLoginFailedModel;

  Future<void> signInUser(String username, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await AuthService().signInUser(username, password);
      print("MY_RESPNSE: " + response.body.toString());

      if (response.statusCode == 200) {
        _userModel = userModelFromJson(response.body);
        _message = _userModel!.message;
        _status = _userModel!.status;

        // Save user data to SharedPreferences
        await AppSharedPreferences().saveUserData(_userModel!);
      } else if (response.statusCode == 404) {
        _userLoginFailedModel = userLoginFailedModelFromJson(response.body);
        _message = _userLoginFailedModel!.message;
        _status = _userLoginFailedModel!.status;
      } else {
        _message = "Unauthorized!";
        _status = 'error';
      }
    } catch (e) {
      _message = "Unauthorized!";
      _status = 'error';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
