import 'package:flutter/material.dart';

class AlreadyAutoLogged with ChangeNotifier {
  bool _alreadAutoLogged = false;

  AlreadyAutoLogged();

  bool get alreadAutoLogged => _alreadAutoLogged;

  void setAlreadyAutoLogged(bool value) {
    _alreadAutoLogged = value;
  }
}
