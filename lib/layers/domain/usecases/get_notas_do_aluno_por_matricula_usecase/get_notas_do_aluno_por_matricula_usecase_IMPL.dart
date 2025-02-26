import 'get_notas_do_aluno_por_matricula_use_case.dart';
import '../../entities/models/gradeDiary_entity.dart';
import '../../repositories/get_notas_do_aluno_por_matricula_usecase/get_aluno_por_matricula_repository.dart';

class GetNotasDoAlunoPorMatriculaUseCaseImpl implements GetNotasDoAlunoPorMatriculaUseCase {
  final GetNotasDoAlunoPorMatriculaRepository _repository;

  GetNotasDoAlunoPorMatriculaUseCaseImpl(this._repository);

  @override
  Future<List<GradeDiaryEntity?>?> call(String matricula) async {
    if (matricula.isEmpty) {
      throw ArgumentError('A matrícula não pode ser vazia.');
    }

    try {
      return await _repository.call(matricula) ?? [];
    } catch (e) {
      throw Exception('Erro ao buscar notas do aluno: $e');
    }
  }
}