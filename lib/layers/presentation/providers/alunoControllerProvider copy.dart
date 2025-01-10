import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/aluno_controller.dart';

class AlunoControlerProvider with ChangeNotifier {
  AlunoController _alunoController;

  AlunoControlerProvider(
    this._alunoController,
  );

  // Getters

  AlunoController get alunoController => _alunoController;

  // Setters

  void setAlunoControler(AlunoController c) {
    _alunoController = c;
    notifyListeners();
  }
}
