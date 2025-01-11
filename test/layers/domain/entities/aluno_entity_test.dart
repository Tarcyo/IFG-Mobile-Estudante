import 'package:flutter_test/flutter_test.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/aluno_entity.dart';

void main() {
  group('AlunoEntity', () {
    test('deve criar um aluno com os dados corretos', () {
      // Criação de um objeto AlunoEntity
      final aluno = AlunoEntity(
        matricula: '12345',
        nome: 'João Silva',
        nomePai: 'Carlos Silva',
        nomeMae: 'Maria Silva',
        curso: 'Engenharia',
        turno: 'Integral',
        modalidade: 'Presencial',
        ano: 2025,
        periodoLetivo: 1,
        polo: 'Campus A',
        dataInicio: DateTime(2025, 1, 1),
        dataFim: DateTime(2025, 12, 31),
        matriz: 'MATR123',
        situacao: 'Ativo',
        fullImageUrl: 'https://example.com/image.jpg',
      );

      expect(aluno.getMatricula, '12345');
      expect(aluno.getNome, 'João Silva');
      expect(aluno.getNomePai, 'Carlos Silva');
      expect(aluno.getNomeMae, 'Maria Silva');
      expect(aluno.getCurso, 'Engenharia');
      expect(aluno.getTurno, 'Integral');
      expect(aluno.getModalidade, 'Presencial');
      expect(aluno.getAno, 2025);
      expect(aluno.getPeriodoLetivo, 1);
      expect(aluno.getPolo, 'Campus A');
      expect(aluno.getDataInicio, DateTime(2025, 1, 1));
      expect(aluno.getDataFim, DateTime(2025, 12, 31));
      expect(aluno.getMatriz, 'MATR123');
      expect(aluno.getSituacao, 'Ativo');
      expect(aluno.getFullImageUrl, 'https://example.com/image.jpg');
    });

    test('deve retornar a representação correta como string', () {
      final aluno = AlunoEntity(
        matricula: '12345',
        nome: 'João Silva',
        nomePai: 'Carlos Silva',
        nomeMae: 'Maria Silva',
        curso: 'Engenharia',
        turno: 'Integral',
        modalidade: 'Presencial',
        ano: 2025,
        periodoLetivo: 1,
        polo: 'Campus A',
        dataInicio: DateTime(2025, 1, 1),
        dataFim: DateTime(2025, 12, 31),
        matriz: 'MATR123',
        situacao: 'Ativo',
        fullImageUrl: 'https://example.com/image.jpg',
      );

      final toStringResult = aluno.toString();

      // Verifique se a string gerada é igual ao esperado
      expect(toStringResult, 
        'Aluno(matricula: 12345, nome: João Silva, nomePai: Carlos Silva, nomeMae: Maria Silva, curso: Engenharia, turno: Integral, modalidade: Presencial, ano: 2025, periodoLetivo: 1, polo: Campus A, dataInicio: 2025-01-01 00:00:00.000, dataFim: 2025-12-31 00:00:00.000, matriz: MATR123, situacao: Ativo, fullImageUrl: https://example.com/image.jpg)');
    });

    test('deve lidar corretamente com valores nulos', () {
      final aluno = AlunoEntity(
        matricula: '12345',
        nome: 'João Silva',
        nomePai: null,
        nomeMae: null,
        curso: null,
        turno: null,
        modalidade: null,
        ano: null,
        periodoLetivo: null,
        polo: null,
        dataInicio: null,
        dataFim: null,
        matriz: null,
        situacao: null,
        fullImageUrl: null,
      );

      expect(aluno.getNomePai, isNull);
      expect(aluno.getNomeMae, isNull);
      expect(aluno.getCurso, isNull);
      expect(aluno.getTurno, isNull);
      expect(aluno.getModalidade, isNull);
      expect(aluno.getAno, isNull);
      expect(aluno.getPeriodoLetivo, isNull);
      expect(aluno.getPolo, isNull);
      expect(aluno.getDataInicio, isNull);
      expect(aluno.getDataFim, isNull);
      expect(aluno.getMatriz, isNull);
      expect(aluno.getSituacao, isNull);
      expect(aluno.getFullImageUrl, isNull);
    });
  });
}