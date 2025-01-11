import 'package:ifg_mobile_estudante/layers/data/datasources/get_notasDoAlunoPorMatricula_datasource.dart';
import 'package:ifg_mobile_estudante/layers/domain/repositories/get_notas_do_aluno_por_matricula_usecase/get_aluno_por_matricula_repository.dart';
import '../../../domain/entities/models/gradeDiary_entity.dart';

class GetNotasDoAlunoPorMatriculaRepositoryIMPL
    implements GetNotasDoAlunoPorMatriculaRepository {
  final GetNotasdoalunopormatriculaDatasource _getNotasDoAlunoAlunoPorMatriculaDatasource;

  GetNotasDoAlunoPorMatriculaRepositoryIMPL(this._getNotasDoAlunoAlunoPorMatriculaDatasource);

  @override
  Future<List<GradeDiaryEntity>> call(String matricula) async {
    final notassDiaryDTO = await _getNotasDoAlunoAlunoPorMatriculaDatasource.call(matricula);

    if (notassDiaryDTO == null || notassDiaryDTO.isEmpty) {
      return [];
    }

    return notassDiaryDTO.map((dto) => dto?.toEntity()).whereType<GradeDiaryEntity>().toList();
  }
}