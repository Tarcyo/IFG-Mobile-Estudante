import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_notas_do_aluno_por_matricula_usecase/get_notas_do_aluno_por_matricula_use_case.dart';

class NotasController {
  final GetNotasDoAlunoPorMatriculaUseCase _getNotasDoAlunoPorMatriculaUseCase;

  NotasController({required GetNotasDoAlunoPorMatriculaUseCase getNotasAlunoPorMatriculaUseCase}) : _getNotasDoAlunoPorMatriculaUseCase = getNotasAlunoPorMatriculaUseCase;
 
 late List<GradeDiaryEntity?>? notas;
  getAlunoPorMatricula(String matricula)async{
     notas= await _getNotasDoAlunoPorMatriculaUseCase(matricula);
  }
}