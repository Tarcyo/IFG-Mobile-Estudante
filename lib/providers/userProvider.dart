import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String _matricula = '';
  String _senha = '';
  bool _autoLogin = false;
  dynamic _userData=false;

  UserProvider(this._autoLogin,this._matricula,this._senha,this._userData);

  // Getters
  String get matricula => _matricula;
  String get senha => _senha;
  bool get autoLogin => _autoLogin;
  dynamic get userData=> _userData;

  // Setters
  void setMatricula(String value) {
    _matricula = value;
    notifyListeners(); 
  }

  void setSenha(String value) {
    _senha = value;
    notifyListeners();
  }

  void setAutoLogin(bool value) {
    _autoLogin = value;
    notifyListeners();
  }

   void setUserData(dynamic value) {
    _userData= value;
    notifyListeners();
  }
}