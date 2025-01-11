import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/get_student_first_name.dart';
import 'package:ifg_mobile_estudante/core/utils/get_time_of_the_day_helper.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/aluno_entity_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/notas_list_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/schedule/schedule_screen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/grade/grade_discipline_selection.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/report/report_screen.dart';
import 'studentCard/student_card_screen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/material/material_discipline_screen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/very_long_horizontal_button.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/vertical_button_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);
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
    return HeaderBuilderWidget(
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
          child: Consumer<AlunoControlerProvider>(
            builder: (context, provider, child) {
              return Image.network(
                provider.alunoController.aluno!.getFullImageUrl!,
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
      top: Text(
        "Painel do Estudante",
        style: TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
      ),
      bottom: Center(
        child: Consumer<AlunoControlerProvider>(
          builder: (context, provider, child) {
            return Text(
              comprimentoDaHora() +
                  " " +
                  primeiroNomeDoAluno(
                      provider.alunoController.aluno!.getNome) +
                  "!",
              style: TextStyle(
                  fontSize: screenWidth * 0.055, color: backgroundColor),
            );
          },
        ),
      ),
    );
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
                            Consumer<AlunoControlerProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  provider.alunoController.aluno!.getMatricula,
                                  style: TextStyle(
                                    color: messageTextColor,
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
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
                            Consumer<AlunoControlerProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  provider.alunoController.aluno!.getSituacao!,
                                  style: TextStyle(
                                    color: messageTextColor,
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
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
                            Consumer<AlunoControlerProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  provider.alunoController.aluno!.getNome,
                                  style: TextStyle(
                                    color: messageTextColor,
                                    fontSize: screenWidth * 0.033,
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              },
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
                VerticalButtonWidget(
                  'Horário \nDe Aula',
                  Icons.calendar_month,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScheduleScreen()),
                  ),
                ),
                VerticalButtonWidget('Minhas\nNotas', Icons.emoji_events,
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
                  final AlunoControlerProvider alunoProvider =
                      Provider.of<AlunoControlerProvider>(context,
                          listen: false);

                  final NotasControlerProvider notasControlerProvider =
                      Provider.of<NotasControlerProvider>(context,
                          listen: false);

                  await notasControlerProvider.controller.getAlunoPorMatricula(
                      alunoProvider.alunoController.aluno!.getMatricula);

                  Navigator.of(context, rootNavigator: true).pop();

                  if (notasControlerProvider.controller.notas == null) {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GradeDisciplineScreen(),
                      ),
                    );
                  }
                }),
                VerticalButtonWidget(
                  'Meu\nBoletim',
                  Icons.assignment,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportScreen()),
                  ),
                ),
                VerticalButtonWidget(
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
          Consumer<AlunoControlerProvider>(
            builder: (context, provider, child) {
              return VeryLongHorizontalButtonWidget(
                "Carteira estudantil",
                Icons.badge,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentCardScreen()),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
