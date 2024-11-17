import 'package:http/http.dart' as http;

Future<dynamic> solicitaNotasAluno(final String matricula) async {
  const String url = 'https://visao.ifg.edu.br/notas.php';

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
      return response.body;
    } else {
      print('Falha na requisição: ${response.statusCode}');
    }
  } catch (e) {
    print('Erro durante a requisição: $e');
  }

  return false;
}
