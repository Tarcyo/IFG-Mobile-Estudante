import 'package:flutter/material.dart';
import 'report_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';

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
                    .transparent, // Fundo transparente para aplicar o design personalizado
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
                      // Título centralizado
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
                      // Conteúdo do pop-up com emojis para os títulos principais
                      Text(
                        "📆 Seleção de Ano:\n"
                        "➡ Utilize a barra de navegação na parte superior para selecionar o ano do boletim.\n\n"
                        "📋 Situação:\n"
                        "➡ Cada disciplina possui uma indicação: 'Aprovado', 'Reprovado' ou 'Cursando'.\n\n"
                        "📊 Média Final:\n"
                        "➡ Ao lado da situação, você verá a média final obtida, refletindo seu desempenho.\n\n"
                        "🚫 Faltas:\n"
                        "➡ Indica a quantidade de faltas registradas e o máximo permitido.\n"
                        "➡ Se estiver próximo do limite, um alerta será exibido.",
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
      center: Center(
        child: Container(
          height: screenHeight * 0.15,
          width: screenHeight * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.025),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.assignment,
                  size: screenHeight * 0.1,
                  color: Colors.teal.shade900,
                ),
              ],
            ),
          ),
        ),
      ),
      top: Text(
        "Boletim",
        style: TextStyle(fontSize: screenWidth * 0.06, color: Colors.white),
      ),
      bottom: Center(
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.greenAccent[100],
          indicatorColor: Colors.white,
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
