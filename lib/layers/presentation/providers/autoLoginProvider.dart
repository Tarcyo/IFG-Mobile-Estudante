import 'package:flutter/material.dart';
class AutoLoginProvider with ChangeNotifier {
  bool _autoLogin = false;

  AutoLoginProvider(
    this._autoLogin,
  );

  // Getters

  bool get autoLogin => _autoLogin;

  // Setters

  void setAutoLogin(bool value) {
    _autoLogin = value;
    notifyListeners();
  }
}
