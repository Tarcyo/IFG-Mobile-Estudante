import 'package:ifg_mobile_estudante/layers/data/datasources/get_aluno_por_matricula_datasource.dart';
import '../../../domain/repositories/get_aluno_por_matricula_repsitory/get_aluno_por_matricula_repository.dart';
import '../../../domain/entities/models/aluno_entity.dart';

class GetAlunoPorMatriculaRepositoryIMPL
    implements GetAlunoPorMatriculaRepository {
  final GetAlunoPorMatriculaDataSource _getAlunoPorMatriculaDatasource;

  GetAlunoPorMatriculaRepositoryIMPL(this._getAlunoPorMatriculaDatasource);
  @override
  Future<AlunoEntity?> call(String matricula) async {
    final AlunoDTO = await _getAlunoPorMatriculaDatasource.call(matricula);
    if (AlunoDTO == null) {
      return null;
    }
    return AlunoDTO.toEntity();
  }
}
