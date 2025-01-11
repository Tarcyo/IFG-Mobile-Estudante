import 'package:ifg_mobile_estudante/layers/domain/usecases/get_notas_do_aluno_por_matricula_usecase/get_notas_do_aluno_por_matricula_use_case.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_notas_do_aluno_por_matricula_usecase/get_notas_do_aluno_por_matricula_usecase_IMPL.dart';
import 'package:ifg_mobile_estudante/layers/domain/repositories/get_notas_do_aluno_por_matricula_usecase/get_aluno_por_matricula_repository.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/get_notasDoAlunoPorMatricula_datasource.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/remote/notas/get_notas_do_aluno_por_matricula_remote_data_source_IMP.dart';
import 'package:ifg_mobile_estudante/layers/data/repositories/get_notas_do_aluno_por_matricula_repository/get_notas_do_aluno_por_matricula_repository_impl.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
main(){
    test("Deve retornar as notas corretamente", () async {

    GetNotasdoalunopormatriculaDatasource datasource =GetNotasDoAlunoPorMatriculaDataSourceRemoteImp();



    GetNotasDoAlunoPorMatriculaRepository repository =
        GetNotasDoAlunoPorMatriculaRepositoryIMPL(datasource);
    GetNotasDoAlunoPorMatriculaUseCase useCase =
        GetNotasDoAlunoPorMatriculaUseCaseImpl(repository);

    final  result = await useCase.call("20241130030032");
    print("O resultado das notas é: " + result.toString());
    expect(result, isA<List<GradeDiaryEntity>>());
    
    
  });
}