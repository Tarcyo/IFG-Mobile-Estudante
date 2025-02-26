import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/get_student_first_name_helper.dart';
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
import 'package:provider/provider.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: _body(context, screenWidth, screenHeight),
              ),
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
          color: Colors.white,
          size: screenWidth * 0.08,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      right: IconButton(
        icon: Icon(
          Icons.help_outline,
          color: Colors.white,
          size: screenWidth * 0.08,
        ),
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors
                    .transparent, // Fundo transparente para design personalizado
                elevation: 0,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal.shade900,
                        Colors.green.shade800,
                        Colors.teal.shade900,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                    borderRadius: BorderRadius.circular(32.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(screenWidth * 0.045),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Título com emoji
                      Text(
                        "Ajuda",
                        style: TextStyle(
                          fontSize: screenWidth * 0.055,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Conteúdo do popup com seções e emojis
                      Text(
                        "🕒 Horários de Aula:\n"
                        "Veja os horários das aulas ao longo dos dias da semana.\n"
                        "📚 Notas das Atividades:\n"
                        "Confira suas notas em diferentes atividades e avaliações.\n"
                        "📈 Boletim Escolar:\n"
                        "Obtenha uma visão geral de suas notas e faltas. Consulte-o regularmente para acompanhar seu progresso.\n"
                        "📂 Material de Aula:\n"
                        "Acesse os materiais disponibilizados pelos professores para apoiar seu aprendizado.\n"
                        "💳 Carteira Estudantil:\n"
                        "Esta carteira contém suas informações de autenticação, confirmando sua identidade como aluno. "
                        "Ela é válida para acesso seguro tanto dentro quanto fora da instituição, utilizando um QR code para verificação rápida.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.032,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // Botão de ação centralizado
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal.shade400,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Ok",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
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
        style: TextStyle(fontSize: screenWidth * 0.06, color: Colors.white),
      ),
      bottom: Center(
        child: Consumer<AlunoControlerProvider>(
          builder: (context, provider, child) {
            return Text(
              comprimentoDaHora() +
                  " " +
                  primeiroNomeDoAluno(provider.alunoController.aluno!.getNome) +
                  "!",
              style:
                  TextStyle(fontSize: screenWidth * 0.055, color: Colors.white),
            );
          },
        ),
      ),
    );
  }

  Widget _body(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.only(bottom: screenHeight * 0.01),
      color: Colors.green.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: screenWidth * 0.01, height: screenHeight * 0.01),
          // Painel central com Stack para sobrepor o BackgroundWavePainter e o conteúdo
          Center(
            child: Container(
              width: screenWidth * 0.9,
              child: Stack(
                children: [
                  // CustomPaint ocupando toda a área do painel
                  Positioned.fill(
                    child: Opacity(
                      opacity: 1,
                      child: CustomPaint(
                        painter: BackgroundWavePainter(),
                      ),
                    ),
                  ),
                  // Conteúdo principal do painel
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.045),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [
                          Colors.teal.shade900,
                          Colors.green.shade600,
                          Colors.teal.shade900,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Primeira linha: Matrícula e Situação
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Coluna da matrícula
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.how_to_reg,
                                      size: screenWidth * 0.1,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      "Matricula",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Consumer<AlunoControlerProvider>(
                                  builder: (context, provider, child) {
                                    return Text(
                                      provider
                                          .alunoController.aluno!.getMatricula,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.033,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                            // Coluna da situação
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.flag,
                                      size: screenWidth * 0.1,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      "Situação",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Consumer<AlunoControlerProvider>(
                                  builder: (context, provider, child) {
                                    return Text(
                                      provider
                                          .alunoController.aluno!.getSituacao!,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.033,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          width: screenWidth * 0.14,
                          height: screenHeight * 0.05,
                        ),
                        // Segunda linha: Nome do estudante
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: screenWidth * 0.1,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: screenWidth * 0.01),
                                    Text(
                                      "Nome do estudante",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Consumer<AlunoControlerProvider>(
                                  builder: (context, provider, child) {
                                    return Text(
                                      provider.alunoController.aluno!.getNome,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.033,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            color: Colors.white70,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
                VerticalButtonWidget(
                  'Minhas\nNotas',
                  Icons.emoji_events,
                  onPressed: () async {
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
                                  fontSize: screenHeight * 0.035,
                                ),
                              ),
                              SizedBox(
                                width: screenHeight * 0.06,
                                height: screenHeight * 0.06,
                                child: CircularProgressIndicator(
                                  strokeWidth: screenHeight * 0.01,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
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

                    await notasControlerProvider.controller
                        .getAlunoPorMatricula(
                            alunoProvider.alunoController.aluno!.getMatricula);

                    Navigator.of(context, rootNavigator: true).pop();

                    if (notasControlerProvider.controller.notas == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
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
                                    color: Colors.white,
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
                                    color: Colors.white,
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
                                      backgroundColor: Colors.white,
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
                                        color: Colors.white,
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
                  },
                ),
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
                      builder: (context) => MaterialDisciplineScreen(),
                    ),
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

// CustomPainter para desenhar uma forma que complementa o design do container
class BackgroundWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define um gradiente sutil utilizando as mesmas cores do container, com opacidade reduzida.
    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.teal.shade900.withValues(alpha: 0.2),
          Colors.green.shade600.withValues(alpha: 0.2),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final Path path = Path();
    // Desenha a forma de onda na parte inferior do painel
    path.moveTo(0, size.height * 0.8);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.75,
      size.width * 0.5,
      size.height * 0.8,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.85,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
