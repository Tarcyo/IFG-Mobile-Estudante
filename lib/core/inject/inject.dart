import 'package:get_it/get_it.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/get_aluno_por_matricula_datasource.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/get_notasDoAlunoPorMatricula_datasource.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/remote/aluno/get_aluno_por_matricula_remote_data_source_IMP.dart';
import 'package:ifg_mobile_estudante/layers/data/datasources/remote/notas/get_notas_do_aluno_por_matricula_remote_data_source_IMP.dart';
import 'package:ifg_mobile_estudante/layers/data/repositories/get_aluno_por_matricula_repository/get_aluno_por_matricula_repository_impl.dart';
import 'package:ifg_mobile_estudante/layers/data/repositories/get_notas_do_aluno_por_matricula_repository/get_notas_do_aluno_por_matricula_repository_impl.dart';
import 'package:ifg_mobile_estudante/layers/domain/repositories/get_aluno_por_matricula_repsitory/get_aluno_por_matricula_repository.dart';
import 'package:ifg_mobile_estudante/layers/domain/repositories/get_notas_do_aluno_por_matricula_usecase/get_aluno_por_matricula_repository.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_aluno_por_matricula_usecase/get_aluno_por_matricula_usecase.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_aluno_por_matricula_usecase/get_aluno_por_matricula_usecase_IMPL.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_notas_do_aluno_por_matricula_usecase/get_notas_do_aluno_por_matricula_use_case.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_notas_do_aluno_por_matricula_usecase/get_notas_do_aluno_por_matricula_usecase.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/aluno_controller.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/notas_controler.dart';

class Inject {
  static void init() {
    GetIt getIt = GetIt.instance;

    //Aluno:
    getIt.registerLazySingleton<GetAlunoPorMatriculaDataSource>(
        () => GetAlunoPorMatriculaRemoteDataSourceImp());

    getIt.registerLazySingleton<GetAlunoPorMatriculaRepository>(
        () => GetAlunoPorMatriculaRepositoryIMPL(getIt()));

    getIt.registerLazySingleton<GetAlunoPorMatriculaUseCase>(
        () => GetAlunoPorMatriculaUseCaseImpl(getIt()));
    getIt.registerFactory<AlunoController>(
        () => AlunoController(getAlunoPorMatriculaUseCase: getIt()));

    //Notas:
    getIt.registerLazySingleton<GetNotasdoalunopormatriculaDatasource>(
        () => GetNotasDoAlunoPorMatriculaDataSourceRemoteImp());

    getIt.registerLazySingleton<GetNotasDoAlunoPorMatriculaRepository>(
        () => GetNotasDoAlunoPorMatriculaRepositoryIMPL(getIt()));

    getIt.registerLazySingleton<GetNotasDoAlunoPorMatriculaUseCase>(
        () => GetNotasDoAlunoPorMatriculaUseCaseImpl(getIt()));
    getIt.registerFactory<NotasController>(
        () => NotasController(getNotasAlunoPorMatriculaUseCase: getIt()));
  }
}
