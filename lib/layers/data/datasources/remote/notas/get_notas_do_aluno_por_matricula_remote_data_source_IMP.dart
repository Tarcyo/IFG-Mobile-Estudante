
import '../../get_notasDoAlunoPorMatricula_datasource.dart';
import '../../../dto/gradeDiaryDTO.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GetNotasDoAlunoPorMatriculaDataSourceRemoteImp implements GetNotasdoalunopormatriculaDatasource {
   @override
Future<List<GradeDiaryDTO?>?> call(final String matricula) async {
  const String url = 'https://mobilews.app.ifg.edu.br/notas.php';

  final Map<String, String> dados = {
    'token': 'Kp9Rm3oLbA5q',
    'matricula': matricula,
  };

  try {
    http.Response response = await http.post(
      Uri.parse(url),
      body: dados,
    );

    if (response.statusCode == 200) {
      return GradeDiaryDTO.fromJsonList(json.decode(response.body));
    } else {
      print('Falha na requisição: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro durante a requisição: $e');
  }

  return null;
}

  
}