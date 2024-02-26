import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  get isPasswordVisible => _isPasswordVisible;
}
