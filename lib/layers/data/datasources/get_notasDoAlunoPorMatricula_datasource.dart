import 'package:ifg_mobile_estudante/layers/data/dto/gradeDiaryDTO.dart';

abstract class GetNotasdoalunopormatriculaDatasource{
 Future<List<GradeDiaryDTO?>?> call(String matricula);
}