// application/usecases/get_aluno_por_matricula_usecase_impl.dart
import 'get_aluno_por_matricula_usecase.dart';
import '../../entities/models/aluno_entity.dart';
import '../../repositories/get_aluno_por_matricula_repsitory/get_aluno_por_matricula_repository.dart';

class GetAlunoPorMatriculaUseCaseImpl implements GetAlunoPorMatriculaUseCase {
  final GetAlunoPorMatriculaRepository _repository;

  GetAlunoPorMatriculaUseCaseImpl(this._repository);

  @override
  Future<AlunoEntity?> call(String matricula) async {
    if (matricula.isEmpty) {
      throw ArgumentError('A matrícula não pode ser vazia.');
    }

    return await _repository.call(matricula);
  }
}