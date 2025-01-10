import '../../domain/entities/models/gradeDiary_entity.dart';
class GradeDiaryDTO {
  final String disciplina;
  final double? nota1;
  final double? nota2;
  final double? nota3;
  final double? nota4;
  final double? notaFinal;
  final String situacaoTexto;

  GradeDiaryDTO({
    required this.disciplina,
    this.nota1,
    this.nota2,
    this.nota3,
    this.nota4,
    this.notaFinal,
    required this.situacaoTexto,
  });

  factory GradeDiaryDTO.fromJson(Map<String, dynamic> json) {
    try {
      return GradeDiaryDTO(
        disciplina: json['disciplina'] as String? ?? '',
        nota1: (json['nota_1'] as num?)?.toDouble(),
        nota2: (json['nota_2'] as num?)?.toDouble(),
        nota3: (json['nota_3'] as num?)?.toDouble(),
        nota4: (json['nota_4'] as num?)?.toDouble(),
        notaFinal: (json['nota_final'] as num?)?.toDouble(),
        situacaoTexto: json['situacao_texto'] as String? ?? '',
      );
    } catch (e) {
      throw Exception('Erro ao converter JSON para GradeDiaryDTO: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'disciplina': disciplina,
      'nota_1': nota1,
      'nota_2': nota2,
      'nota_3': nota3,
      'nota_4': nota4,
      'nota_final': notaFinal,
      'situacao_texto': situacaoTexto,
    };
  }

  GradeDiaryEntity toEntity() {
    return GradeDiaryEntity(
      disciplina,
      nota1?.toString(),
      nota2?.toString(),
      nota3?.toString(),
      nota4?.toString(),
      notaFinal?.toString(),
      situacaoTexto,
    );
  }

  static List<GradeDiaryDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => GradeDiaryDTO.fromJson(json)).toList();
  }
}
