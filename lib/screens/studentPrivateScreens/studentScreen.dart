import 'dart:convert' show json;
import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/screens/studentPrivateScreens/schedule/scheduleScreen.dart';
import 'package:ifg_mobile_estudante/screens/studentPrivateScreens/grade/gradeDisciplineSelection.dart';
import 'package:ifg_mobile_estudante/screens/studentPrivateScreens/report/reportScreen.dart';
import 'package:ifg_mobile_estudante/screens/studentPrivateScreens/studentCard/studentCardScreen.dart';
import 'package:ifg_mobile_estudante/screens/studentPrivateScreens/material/materialDisciplineScreen.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/veryLongHorizontalButtom.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/verticalButtom.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';
import 'package:ifg_mobile_estudante/services/apiNotas.dart';

class StudentScreen extends StatelessWidget {
  final Map<String, dynamic> _dadosDoAluno;

  StudentScreen(this._dadosDoAluno, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: _body(context, screenWidth, screenHeight)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(
      BuildContext context, double screenWidth, double screenHeight) {
    return HeaderBuilder(
      left: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: backgroundColor,
          size: screenWidth * 0.08,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      right: IconButton(
        icon: Icon(
          Icons.help_outline,
          color: backgroundColor,
          size: screenWidth * 0.08,
        ),
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ajuda",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Nesta tela é possível visualizar suas informações privadas como estudante\n\nHorários de Aula: Este recurso permite visualizar os horários das aulas ao longo dos dias da semana.\n\nNotas das Atividades: Você pode conferir suas notas em diferentes atividades e avaliações.\n\nBoletim Escolar: Fornece uma visão geral de suas notas e faltas. Consulte-o regularmente para acompanhar seu progresso.\n\nMaterial de Aula: você encontrará materiais disponibilizados pelos professores para apoiar seu aprendizado.",
                      style: TextStyle(
                        color: messageTextColor,
                        fontSize: screenWidth * 0.032,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          // Fechar o diálogo sem sair
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: screenWidth * 0.032,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        },
      ),
      center: Container(
        height: screenHeight * 0.17,
        width: screenHeight * 0.17,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.network(
            _dadosDoAluno['full_image_url'],
            fit: BoxFit.cover,
          ),
        ),
      ),
      top: Text(
        "Painel do Estudante",
        style: TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
      ),
      bottom: Center(
        child: Text(
          _comprimentoDaHora() +
              " " +
              _primeiroNomeDoAluno(_dadosDoAluno['nome']) +
              "!",
          style:
              TextStyle(fontSize: screenWidth * 0.055, color: backgroundColor),
        ),
      ),
    );
  }

  String _comprimentoDaHora() {
    final agora = DateTime.now();
    final hora = agora.hour;

    if (hora >= 6 && hora < 12) {
      return 'Bom Dia,';
    } else if (hora >= 12 && hora < 18) {
      return 'Boa Tarde,';
    } else {
      return 'Boa Noite,';
    }
  }

  String _primeiroNomeDoAluno(String texto) {
    int indiceEspaco = texto.indexOf(' ');

    if (indiceEspaco == -1) {
      return texto;
    }

    return texto.substring(0, indiceEspaco);
  }

  Widget _body(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.only(bottom: screenHeight * 0.01),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: screenWidth * 0.01, height: screenHeight * 0.01),
          Center(
            child: Card(
              color: focusBackgroundColor,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.045),
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.how_to_reg,
                                  size: screenWidth * 0.1,
                                  color: mainColor,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  "Matricula",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _dadosDoAluno["matricula"],
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.033,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.flag,
                                  size: screenWidth * 0.1,
                                  color: mainColor,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  "Situação",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _dadosDoAluno['situacao'],
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.033,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                        width: screenWidth * 0.14, height: screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  size: screenWidth * 0.1,
                                  color: mainColor,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Text(
                                  "Nome do estudante",
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.05,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              _dadosDoAluno['nome'],
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.033,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: screenWidth * 0.05),
                VerticalButtom(
                  'Horário \nDe Aula',
                  Icons.calendar_month,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen()),
                  ),
                ),
                VerticalButtom('Minhas\nNotas', Icons.emoji_events,
                    onPressed: () async {
                  // Exibir o diálogo de carregamento
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Carregando...",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenHeight * 0.035),
                            ),
                            SizedBox(
                              width: screenHeight * 0.06,
                              height: screenHeight * 0.06,
                              child: CircularProgressIndicator(
                                strokeWidth:
                                    screenHeight * 0.01, // Espessura da linha
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  final notasDoAluno =
                      await solicitaNotasAluno(_dadosDoAluno['matricula']);

                  print("As notas são:"+notasDoAluno.toString());

                  Navigator.of(context, rootNavigator: true).pop();

                  if (notasDoAluno == false) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: backgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Atenção",
                                style: TextStyle(
                                  fontSize: screenWidth * 0.055,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Falha ao tentar conectar.\nVerifique seus dados e tente novamente.",
                                style: TextStyle(
                                  color: messageTextColor,
                                  fontSize: screenWidth * 0.032,
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(180.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Ok",
                                    style: TextStyle(
                                      color: backgroundColor,
                                      fontSize: screenWidth * 0.032,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    final List<dynamic> notasDoAlunoDecodificadas =
                        json.decode(notasDoAluno);

                    print(
                        "As notas são:" + notasDoAlunoDecodificadas[0].toString());
        

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GradeDisciplineScreen(notasDoAlunoDecodificadas),
                      ),
                    );
                  }
                }),
                VerticalButtom(
                  'Meu\nBoletim',
                  Icons.assignment,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportScreen()),
                  ),
                ),
                VerticalButtom(
                  'Material\nde aula',
                  Icons.book,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MaterialDisciplineScreen()),
                  ),
                ),
                SizedBox(width: screenWidth * 0.1),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.017),
          VeryLongHorizontalButtom(
            "Carteira estudantil",
            Icons.badge,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentCardScreen(_dadosDoAluno)),
            ),
          ),
        ],
      ),
    );
  }
}
