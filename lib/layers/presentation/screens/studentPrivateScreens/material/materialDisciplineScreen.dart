import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/headerBuilder.dart';
import 'materialDisciplineCard.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class MaterialDisciplineScreen extends StatefulWidget {
  MaterialDisciplineScreen({Key? key}) : super(key: key);

  @override
  _MaterialDisciplineScreenState createState() =>
      _MaterialDisciplineScreenState();

  final List<String> yearsOfReport = [
    "2024/1",
    "2023/2",
    "2023/1",
    "2022/2",
    "2022/1"
  ];
}

class _MaterialDisciplineScreenState extends State<MaterialDisciplineScreen>
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

  Widget _body(context, screenWidth, screenHeight) {
    return TabBarView(
      controller: _tabController,
      children: widget.yearsOfReport
          .map((day) => _buildDaySchedule(context, screenWidth, screenHeight))
          .toList(),
    );
  }

  Widget _header(context, screenWidth, screenHeight) {
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
        onPressed: () {},
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
            padding: EdgeInsets.all(screenWidth * 0.02),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.book,
                  size: screenHeight * 0.1,
                  color: mainColor,
                ),
              ],
            ),
          ),
        ),
      ),
      top: Text(
        "Material de aula",
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

  Widget _buildDaySchedule(BuildContext context, screenWidth, screenHeight) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: screenWidth * 0.02,
            height: screenWidth * 0.02,
          ),
          Center(
            child: Text(
              "Selecione a disciplina",
              style: TextStyle(fontSize: screenWidth * 0.05, color: mainColor),
            ),
          ),
          _buildDisciplineCard("Sistemas Distribuídos"),
          _buildDisciplineCard("Prática Fábrica de Software"),
        ],
      ),
    );
  }

  Widget _buildDisciplineCard(String disciplineName) {
    return MaterialDisciplineCard(discipline: disciplineName);
  }
}
