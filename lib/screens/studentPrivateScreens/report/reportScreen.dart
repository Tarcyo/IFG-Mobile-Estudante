import 'package:flutter/material.dart';
import 'reportCard.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
  final List<String> yearsOfReport = [
    "2024/1",
    "2023/2",
    "2023/1",
    "2022/2",
    "2022/1"
  ];
}

class _ReportScreenState extends State<ReportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: widget.yearsOfReport.length,
      vsync: this,
    );
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

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return TabBarView(
      controller: _tabController,
      children: widget.yearsOfReport
          .map((day) =>
              _buildDaySchedule(context, day, screenWidth, screenHeight))
          .toList(),
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
                      "Seleção de Ano: Utilize a barra de navegação na parte superior da tela para selecionar o ano do boletim que deseja visualizar.\n\nSituação: Cada disciplina listada no boletim possui uma indicação de situação. Isso pode ser 'Aprovado', 'Reprovado' ou 'Cursando'.\n\nMédia Final: Ao lado da situação, você encontrará a média final obtida na disciplina. Essa é uma representação do seu desempenho ao longo do ano letivo.\n\nFaltas: A quantidade de faltas registradas na disciplina e máximo permitido de faltas. Se você estiver próximo do limite máximo de faltas e houver risco de reprovação por falta, um alerta será exibido para avisá-lo(a).",
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
      center: Center(
        child: Container(
          height: screenHeight * 0.15,
          width: screenHeight * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor,
            border: Border.all(color: mainColor, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.025),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.assignment,
                  size: screenHeight * 0.1,
                  color: mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
      top: Text(
        "Boletim",
        style: TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
      ),
      bottom: Center(
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelColor: backgroundColor,
          unselectedLabelColor: Colors.greenAccent[100],
          indicatorColor: backgroundColor,
          dividerColor: Colors.transparent,
          indicatorPadding: EdgeInsets.zero,
          tabs: widget.yearsOfReport
              .map(
                (day) => Tab(
                  child: Container(
                    child: Text(
                      day,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildDaySchedule(
      BuildContext context, String year, screenWidth, screenHeight) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenWidth * 0.04),
          ReportCard(
            maxAbsences: 18,
            situation: "Aprovado",
            absences: 2,
            grade: 7.0,
            teacher: "Leandro Freitas",
            discipline: "Sistema distribuídos",
          ),
          ReportCard(
            maxAbsences: 18,
            situation: "Reprovado",
            absences: 20,
            grade: 8.5,
            teacher: "Elymar Cabral",
            discipline: "Prática Fábrica de Software",
          ),
          ReportCard(
            maxAbsences: 18,
            situation: "Cursando",
            absences: 13,
            grade: 5.7,
            teacher: "Cleiton José",
            discipline: "Governança Corporativa",
          ),
          SizedBox(height: screenWidth * 0.04),
        ],
      ),
    );
  }
}
