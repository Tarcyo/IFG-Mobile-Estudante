import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/notas_controler.dart';

class NotasControlerProvider with ChangeNotifier {
  NotasController _controller;

  NotasControlerProvider(
    this._controller,
  );

  // Getters

  NotasController get controller => _controller;

  // Setters

  void setAlunoControler(NotasController c) {
    _controller = c;
    notifyListeners();
  }
}
