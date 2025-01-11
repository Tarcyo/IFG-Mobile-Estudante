import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/schedule/schedule_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

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
                      "Aqui você pode ver os horários das suas aulas ao longo da semana.\n\nDia da Semana: Utilize a barra de navegação na parte superior da tela para alternar entre os dias da semana.\n\nHorários das Aulas: Os horários de cada dia são exibidos verticalmente. Cada horário de aula inclui as seguintes informações:\n\nDisciplina: O nome da disciplina que será ensinada naquela aula.\n\nProfessor: O nome do professor responsável pela disciplina.\n\nLocal: O local onde a aula será realizada.",
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
        height: screenHeight * 0.15,
        width: screenHeight * 0.15,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: mainColor, width: screenWidth * 0.0025),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Icon(
            Icons.calendar_month,
            size: screenHeight * 0.1,
            color: mainColor,
          ),
        ),
      ),
      top: Text(
        "Horário de aula",
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
