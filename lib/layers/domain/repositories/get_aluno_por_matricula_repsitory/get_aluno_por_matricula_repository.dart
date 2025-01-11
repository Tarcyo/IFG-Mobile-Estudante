import '../../entities/models/aluno_entity.dart';

abstract class GetAlunoPorMatriculaRepository {
  Future<AlunoEntity?> call(String matricula);
}