import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
import 'grade_activity_card.dart';
import 'grade_period_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';

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
        backgroundColor: Colors.green.shade100,
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
    return HeaderBuilderWidget(
        left: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: screenWidth * 0.08,
          ),
          onPressed: () => {Navigator.of(context).pop()},
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
                        Text(
                          "📅 Seleção de Período:\n"
                          "➡ Utilize a barra de navegação na parte superior para selecionar o período letivo desejado.\n\n"
                          "📊 Média Final da Etapa:\n"
                          "➡ No card grande exibido na parte superior, você encontrará sua média final da etapa.\n\n"
                          "📝 Notas Individuais de Atividades:\n"
                          "➡ Abaixo da média final, você verá cards menores representando suas notas individuais em cada atividade.\n\n"
                          "🏆 Ícone de Troféu:\n"
                          "➡ Se sua nota estiver dentro da média, você verá um ícone de troféu, indicando um bom desempenho.\n\n"
                          "⚠️ Ícone de Alerta:\n"
                          "➡ Se sua nota estiver abaixo da média, um ícone de alerta será exibido.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.032,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: screenHeight * 0.03),
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
        center: Center(
          child: Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(color: Colors.white, width: screenWidth * 0.005),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.emoji_events,
                    size: screenHeight * 0.1,
                    color: Colors.teal.shade900,
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
            color: Colors.white,
          ),
          maxLines: 1, 
          overflow: TextOverflow.fade,
          softWrap: false, 
        ),
        bottom: Center(
          child: Text(
            "Situação: " + widget._discipline_data!.situacao!,
            style: TextStyle(
                fontSize: screenWidth * 0.055, color: Colors.white),
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
