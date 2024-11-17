import 'package:flutter/material.dart';

class AlreadAutoLogged with ChangeNotifier {
  bool _alreadAutoLogged = false;

  AlreadAutoLogged();

  bool get alreadAutoLogged => _alreadAutoLogged;

  // Setters
  void setAlreadAutoLogged(bool value) {
    _alreadAutoLogged = value;
    notifyListeners();
  }
}
