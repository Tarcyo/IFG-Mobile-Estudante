import '../../domain/entities/models/aluno_entity.dart';

class AlunoDTO extends AlunoEntity {
  final String matricula;
  final String nome;
  final String? nomePai;
  final String? nomeMae;
  final String? curso;
  final String? turno;
  final String? modalidade;
  final int? ano;
  final int? periodoLetivo;
  final String? polo;
  final DateTime? dataInicio;
  final DateTime? dataFim;
  final String? matriz;
  final String? situacao;
  final String? fullImageUrl;

  AlunoDTO({
    required this.matricula,
    required this.nome,
    this.nomePai,
    required this.nomeMae,
    required this.curso,
    required this.turno,
    required this.modalidade,
    required this.ano,
    required this.periodoLetivo,
    this.polo,
    required this.dataInicio,
    this.dataFim,
    required this.matriz,
    required this.situacao,
    required this.fullImageUrl,
  }) : super(
          matricula: matricula,
          nome: nome,
          nomePai: nomePai,
          nomeMae: nomeMae,
          curso: curso,
          turno: turno,
          modalidade: modalidade,
          ano: ano,
          periodoLetivo: periodoLetivo,
          polo: polo,
          dataInicio: dataInicio,
          dataFim: dataFim,
          matriz: matriz,
          situacao: situacao,
          fullImageUrl: fullImageUrl,
        );

  factory AlunoDTO.fromEntity(AlunoEntity aluno) {
    return AlunoDTO(
      matricula: aluno.getMatricula,
      nome: aluno.getNome,
      nomePai: aluno.getNomePai,
      nomeMae: aluno.getNomeMae,
      curso: aluno.getCurso,
      turno: aluno.getTurno,
      modalidade: aluno.getModalidade,
      ano: aluno.getAno,
      periodoLetivo: aluno.getPeriodoLetivo,
      polo: aluno.getPolo,
      dataInicio: aluno.getDataInicio,
      dataFim: aluno.getDataFim,
      matriz: aluno.getMatriz,
      situacao: aluno.getSituacao,
      fullImageUrl: aluno.getFullImageUrl,
    );
  }

  AlunoEntity toEntity() {
    return AlunoEntity(
      matricula: matricula,
      nome: nome,
      nomePai: nomePai,
      nomeMae: nomeMae,
      curso: curso,
      turno: turno,
      modalidade: modalidade,
      ano: ano,
      periodoLetivo: periodoLetivo,
      polo: polo,
      dataInicio: dataInicio,
      dataFim: dataFim,
      matriz: matriz,
      situacao: situacao,
      fullImageUrl: fullImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matricula': matricula,
      'nome': nome,
      'nomePai': nomePai,
      'nomeMae': nomeMae,
      'curso': curso,
      'turno': turno,
      'modalidade': modalidade,
      'ano': ano,
      'periodoLetivo': periodoLetivo,
      'polo': polo,
      'dataInicio': dataInicio?.toIso8601String(),
      'dataFim': dataFim?.toIso8601String(),
      'matriz': matriz,
      'situacao': situacao,
      'fullImageUrl': fullImageUrl,
    };
  }

  factory AlunoDTO.fromJson(Map<String, dynamic> json) {
    return AlunoDTO(
      matricula: json['matricula'],
      nome: json['nome'],
      nomePai: json['nome_pai'],
      nomeMae: json['nome_mae'],
      curso: json['curso'],
      turno: json['turno'],
      modalidade: json['modalidade'],
      ano: json['ano'],
      periodoLetivo: json['periodo_letivo'],
      polo: json['polo'],
      dataInicio: json['data_inicio'] != null ? DateTime.parse(json['data_inicio']) : null,
      dataFim: json['data_fim'] != null ? DateTime.parse(json['data_fim']) : null,
      matriz: json['matriz'],
      situacao: json['situacao'],
      fullImageUrl: json['full_image_url'],
    );
  }

  @override
  String toString() {
    return 'AlunoDTO(matricula: $matricula, nome: $nome, nomePai: $nomePai, nomeMae: $nomeMae, curso: $curso, turno: $turno, modalidade: $modalidade, ano: $ano, periodoLetivo: $periodoLetivo, polo: $polo, dataInicio: $dataInicio, dataFim: $dataFim, matriz: $matriz, situacao: $situacao, fullImageUrl: $fullImageUrl)';
  }
}
