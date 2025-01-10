import 'package:ifg_mobile_estudante/layers/data/dto/alunoDTO.dart';

abstract class GetAlunoPorMatriculaDataSource {
 Future<AlunoDTO?>call(String matricula);
}