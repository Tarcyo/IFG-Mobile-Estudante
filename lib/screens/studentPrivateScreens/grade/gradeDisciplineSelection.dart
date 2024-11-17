import 'package:flutter/material.dart';
import 'gradeDisciplineCard.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class GradeDisciplineScreen extends StatefulWidget {
  final dynamic _notasDoAluno;
  GradeDisciplineScreen(this._notasDoAluno, {Key? key}) : super(key: key);

  @override
  _GradeDisciplineScreenState createState() => _GradeDisciplineScreenState();
  final List<String> yearsOfReport = [
    "2024/1",
    "2023/2",
    "2023/1",
    "2022/2",
    "2022/1"
  ];
}

class _GradeDisciplineScreenState extends State<GradeDisciplineScreen>
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
          .map((day) => _buildItem(context, screenWidth, screenHeight))
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
                      "Aqui você pode selecionar o ano na parte superir da tela e então selecionar a disciplina que deseja ver suas notas.",
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
          border: Border.all(color: mainColor, width: 1),
        ),
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.02),
          child: Icon(
            Icons.emoji_events,
            size: screenHeight * 0.1,
            color: mainColor,
          ),
        ),
      ),
      top: Text(
        "Minhas notas",
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
                        fontSize: screenWidth * 0.04,
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

  Widget _buildItem(BuildContext context, screenWidth, screenHeight) {
    final List<Widget> disciplines = [];
    for (final data in widget._notasDoAluno) {
      disciplines.add(GradeDisciplineCard(data));
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
          ),
          Center(
            child: Text(
              "Selecione a disciplina: ",
              style: TextStyle(fontSize: screenWidth * 0.05, color: mainColor),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.05,
            height: screenWidth * 0.05,
          ),
          ...disciplines
        ],
      ),
    );
  }
}
