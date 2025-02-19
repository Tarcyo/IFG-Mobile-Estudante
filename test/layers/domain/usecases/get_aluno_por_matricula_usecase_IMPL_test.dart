import 'package:flutter_test/flutter_test.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/get_aluno_por_matricula_datasource.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/remote/aluno/get_aluno_por_matricula_remote_data_source_IMP.dart';
import 'package:ifg_mobile_estudante/layers/domain/repositories/get_aluno_por_matricula_repsitory/get_aluno_por_matricula_repository.dart';
import 'package:ifg_mobile_estudante/layers/data/repositories/get_aluno_por_matricula_repository/get_aluno_por_matricula_repository_impl.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_aluno_por_matricula_usecase/get_aluno_por_matricula_usecase.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_aluno_por_matricula_usecase/get_aluno_por_matricula_usecase_IMPL.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/aluno_entity.dart';

main() {
  test("Deve retornar o aluno corretamente", () async {

    GetAlunoPorMatriculaDataSource datasource =GetAlunoPorMatriculaRemoteDataSourceImp();



    GetAlunoPorMatriculaRepository repository =
        GetAlunoPorMatriculaRepositoryIMPL(datasource);
    GetAlunoPorMatriculaUseCase useCase =
        GetAlunoPorMatriculaUseCaseImpl(repository);

    final  result = await useCase.call("20211030180055");
    print("O resultado é: " + result.toString());
    expect(result, isNotNull);
    expect(result, isA<AlunoEntity>());
    expect(result!.getNome, equals("Tárcyo Guilherme Maia Borges"));
    expect(result.getMatricula, equals("20211030180055"));
  });




}
