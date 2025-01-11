class AlunoEntity {
  final String _matricula;
  final String _nome;
  final String? _nomePai;
  final String? _nomeMae;
  final String? _curso;
  final String? _turno;
  final String? _modalidade;
  final int? _ano;
  final int? _periodoLetivo;
  final String? _polo;
  final DateTime? _dataInicio;
  final DateTime? _dataFim;
  final String? _matriz;
  final String? _situacao;
  final String? _fullImageUrl;

  // Construtor
  AlunoEntity({
    required String matricula,
    required String nome,
    String? nomePai,
    required String? nomeMae,
    required String? curso,
    required String? turno,
    required String? modalidade,
    required int? ano,
    required int? periodoLetivo,
    String? polo,
    required DateTime? dataInicio,
    DateTime? dataFim,
    required String? matriz,
    required String? situacao,
    required String? fullImageUrl,
  }) : _fullImageUrl = fullImageUrl, _situacao = situacao, _matriz = matriz, _dataFim = dataFim, _dataInicio = dataInicio, _polo = polo, _periodoLetivo = periodoLetivo, _ano = ano, _modalidade = modalidade, _turno = turno, _curso = curso, _nomeMae = nomeMae, _nomePai = nomePai, _nome = nome, _matricula = matricula;

  // Getters
  String get getMatricula => _matricula;
  String get getNome => _nome;
  String? get getNomePai => _nomePai;
  String? get getNomeMae => _nomeMae;
  String? get getCurso => _curso;
  String? get getTurno => _turno;
  String? get getModalidade => _modalidade;
  int? get getAno => _ano;
  int? get getPeriodoLetivo => _periodoLetivo;
  String? get getPolo => _polo;
  DateTime? get getDataInicio => _dataInicio;
  DateTime? get getDataFim => _dataFim;
  String? get getMatriz => _matriz;
  String? get getSituacao => _situacao;
  String? get getFullImageUrl => _fullImageUrl;

  @override
  String toString() {
    return 'Aluno(matricula: $_matricula, nome: $_nome, nomePai: $_nomePai, nomeMae: $_nomeMae, curso: $_curso, turno: $_turno, modalidade: $_modalidade, ano: $_ano, periodoLetivo: $_periodoLetivo, polo: $_polo, dataInicio: $_dataInicio, dataFim: $_dataFim, matriz: $_matriz, situacao: $_situacao, fullImageUrl: $_fullImageUrl)';
  }
}
