import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/schedule/schedule_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> daysOfWeek = [
    "Segunda",
    "Terça",
    "Quarta",
    "Quinta",
    "Sexta"
  ];

  @override
  void initState() {
    super.initState();
    int currentDayIndex = DateTime.now().weekday - 1;
    if (currentDayIndex < 0 || currentDayIndex >= daysOfWeek.length) {
      currentDayIndex = 0;
    }
    _tabController = TabController(
      length: daysOfWeek.length,
      vsync: this,
      initialIndex: currentDayIndex,
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

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return TabBarView(
      controller: _tabController,
      children: daysOfWeek
          .map((day) => _buildDaySchedule(context, screenWidth, screenHeight))
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
                    .transparent, // Fundo transparente para um design personalizado
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
                      // Mensagem
                      Text(
                        "Aqui você pode ver os horários das suas aulas ao longo da semana.\n\n"
                        "➡ **Dia da Semana:** Utilize a barra de navegação na parte superior da tela para alternar entre os dias.\n\n"
                        "➡ **Horários das Aulas:** Exibidos verticalmente, com as seguintes informações:\n\n"
                        "📌 **Disciplina:** Nome da disciplina.\n"
                        "👨‍🏫 **Professor:** Nome do professor.\n"
                        "📍 **Local:** Onde a aula será realizada.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.032,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // Botão de ação
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.teal.shade400, // Verde para consistência
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
          )
        },
      ),
      center: Container(
        height: screenHeight * 0.15,
        width: screenHeight * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.white, width: screenWidth * 0.0025),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Icon(
            Icons.calendar_month,
            size: screenHeight * 0.1,
            color: Colors.teal.shade900,
          ),
        ),
      ),
      top: Text(
        "Horário de aula",
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
          tabs: daysOfWeek
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

  Widget _buildDaySchedule(BuildContext context, screenWidth, screenHeight) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScheduleCard(
            begin: "19:00",
            end: "20:45",
            classroom: "311",
            discipline: "Sistemas Distribuidos",
            teacher: "Leandro Freitas",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
          const ScheduleCard(
            begin: "20:45",
            end: "22:30",
            classroom: "311",
            discipline: "Prática Fábrica de Software",
            teacher: "Elymar Cabral",
          ),
        ],
      ),
    );
  }
}
