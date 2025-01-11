
import '../../get_aluno_por_matricula_datasource.dart';
import '../../../dto/alunoDTO.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetAlunoPorMatriculaRemoteDataSourceImp implements GetAlunoPorMatriculaDataSource {
   @override
  Future<AlunoDTO?> call(String matricula) async {
    const String url = 'https://mobilews.app.ifg.edu.br/alunos.php';
    final Map<String, String> dados = {
      'token': 'Kp9Rm3oLbA5q',
      'matricula': matricula,
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: dados,
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = json.decode(response.body);

        final AlunoDTO alunoDTO = AlunoDTO.fromJson(jsonResponse);
        return alunoDTO;
      } else {
        print('Falha na requisição: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
    }

    return null;
  }
  
}