// domain/usecases/get_aluno_por_matricula_usecase.dart

import '../../entities/models/gradeDiary_entity.dart';

abstract class GetNotasDoAlunoPorMatriculaUseCase{
  Future<List<GradeDiaryEntity?>?>call(String matricula);
}