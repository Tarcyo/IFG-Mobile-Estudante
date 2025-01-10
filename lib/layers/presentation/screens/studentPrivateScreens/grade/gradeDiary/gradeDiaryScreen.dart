import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
import 'gradeActivityCard.dart';
import 'gradePeriodCard.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class GradeDiaryScreen extends StatefulWidget {
  final GradeDiaryEntity? _discipline_data;
  GradeDiaryScreen(this._discipline_data, {Key? key});

  @override
  State<GradeDiaryScreen> createState() => _GradeDiaryScreenState();
}

class _GradeDiaryScreenState extends State<GradeDiaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> periods = [
    "1° Bimestre",
    "2° Bimestre",
    "3° Bimestre",
    "4° Bimestre",
  ];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: periods.length,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: _body(context, screenWidth, screenHeight),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context, screenWidth, screenHeight) {
    return HeaderBuilder(
        left: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: backgroundColor,
            size: screenWidth * 0.08,
          ),
          onPressed: () => {Navigator.of(context).pop()},
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
                        "Seleção de Período: Utilize a barra de navegação na parte superior da tela para selecionar o período letivo desejado.\n\nMédia Final da Etapa: No card grande exibido na parte superior da tela, você encontrará sua média final da etapa. Notas Individuais de Atividades: Abaixo da média final, você verá cards menores representando suas notas individuais em cada atividade. \n\nÍcone de Troféu: Se sua nota estiver dentro da média, você verá um ícone de troféu. Isso indica um bom desempenho na atividade.\n\nÍcone de Alerta: Se sua nota estiver abaixo da média, um ícone de alerta será exibido.",
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
        center: Center(
          child: Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: backgroundColor,
              border: Border.all(color: mainColor, width: screenWidth * 0.005),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.emoji_events,
                    size: screenHeight * 0.1,
                    color: mainColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        top: Text(
          widget._discipline_data!.nomeDisciplina!.substring(
            widget._discipline_data!.nomeDisciplina!.indexOf(' - ') + 2,
          ),
          style: TextStyle(
            fontSize: screenWidth * 0.055,
            color: backgroundColor,
          ),
          maxLines: 1, // Limita a uma linha
          overflow: TextOverflow.fade, // Aplica o efeito de fade
          softWrap: false, // Impede quebra de linha
        ),
        bottom: Center(
          child: Text(
            "Situação: " + widget._discipline_data!.situacao!,
            style: TextStyle(
                fontSize: screenWidth * 0.055, color: backgroundColor),
          ),
        ));
  }

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return TabBarView(
      controller: _tabController,
      children: periods
          .map((day) => _buildScreenBody(context, screenWidth, screenHeight))
          .toList(),
    );
  }

  Widget _buildScreenBody(BuildContext context, screenWidth, screenHeight) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradePeriodCard(
                activityMaxGrade: 100,
                myGrade: widget._discipline_data!.notaFinal,
              ),
            ],
          ),
          SizedBox(
            width: screenWidth * 0.015,
            height: screenWidth * 0.015,
          ),
          GradeActivityCard(
              activityName: "Nota " + "1",
              activityMaxGrade: 100,
              activityType: "Nota do periodo",
              activtyDate: "03/01/2023",
              myGrade: widget._discipline_data!.nota1),
          GradeActivityCard(
              activityName: "Nota " + "2",
              activityMaxGrade: 100,
              activityType: "Nota do periodo",
              activtyDate: "03/01/2023",
              myGrade: widget._discipline_data!.nota2),
          GradeActivityCard(
              activityName: "Nota " + "3",
              activityMaxGrade: 100,
              activityType: "Nota do periodo",
              activtyDate: "03/01/2023",
              myGrade: widget._discipline_data!.nota3),
          GradeActivityCard(
              activityName: "Nota " + "4",
              activityMaxGrade: 100,
              activityType: "Nota do periodo",
              activtyDate: "03/01/2023",
              myGrade: widget._discipline_data!.nota4),
        ],
      ),
    );
  }
}
