// domain/usecases/get_aluno_por_matricula_usecase.dart

import '../../entities/models/aluno_entity.dart';

abstract class GetAlunoPorMatriculaUseCase {
  Future<AlunoEntity?> call(String matricula);
}