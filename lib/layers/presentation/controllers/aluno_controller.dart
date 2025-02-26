import 'package:ifg_mobile_estudante/layers/domain/entities/models/aluno_entity.dart';
import 'package:ifg_mobile_estudante/layers/domain/usecases/get_aluno_por_matricula_usecase/get_aluno_por_matricula_usecase.dart';

class AlunoController {
  final GetAlunoPorMatriculaUseCase _getAlunoPorMatriculaUseCase;

  AlunoController({required GetAlunoPorMatriculaUseCase getAlunoPorMatriculaUseCase}) : _getAlunoPorMatriculaUseCase = getAlunoPorMatriculaUseCase;
 
 late AlunoEntity? aluno;
  getAlunoPorMatricula(String matricula)async{
     aluno= await _getAlunoPorMatriculaUseCase(matricula);
  }
}