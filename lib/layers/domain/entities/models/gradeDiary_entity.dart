class GradeDiaryEntity {
  final String? _nomeDisciplina;
  final String?_nota1;
  final String? _nota2;
  final String? _nota3;
  final String? _nota4;
  final String? _notaFinal;
  final String? _situacao;

  // Construtor
  GradeDiaryEntity(
    this._nomeDisciplina,
    this._nota1,
    this._nota2,
    this._nota3,
    this._nota4,
    this._notaFinal,
    this._situacao,
  );

  // Getters
  String? get nomeDisciplina => _nomeDisciplina;
  String? get nota1 => _nota1;
  String? get nota2 => _nota2;
  String? get nota3 => _nota3;
  String? get nota4 => _nota4;
  String? get notaFinal => _notaFinal;
  String? get situacao => _situacao;

  // Método toString
  @override
  String toString() {
    return 'GradeDiaryEntity{\n'
        '  nomeDisciplina: $_nomeDisciplina,\n'
        '  nota1: $_nota1,\n'
        '  nota2: $_nota2,\n'
        '  nota3: $_nota3,\n'
        '  nota4: $_nota4,\n'
        '  notaFinal: $_notaFinal,\n'
        '  situacao: $_situacao\n'
        '}';
  }
}
