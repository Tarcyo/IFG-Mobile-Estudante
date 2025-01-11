import 'package:flutter/material.dart';
class AutoLoginProvider with ChangeNotifier {
  bool _autoLogin = false;

  AutoLoginProvider(
    this._autoLogin,
  );


  bool get autoLogin => _autoLogin;


  void setAutoLogin(bool value) {
    _autoLogin = value;
    notifyListeners();
  }
}
