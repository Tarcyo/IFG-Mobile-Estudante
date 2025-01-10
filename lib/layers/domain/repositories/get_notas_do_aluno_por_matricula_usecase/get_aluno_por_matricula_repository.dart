import '../../entities/models/gradeDiary_entity.dart';

abstract class GetNotasDoAlunoPorMatriculaRepository {
   Future<List<GradeDiaryEntity?>?> call(String matricula);
}