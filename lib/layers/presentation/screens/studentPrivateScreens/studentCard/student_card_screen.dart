import 'package:flutter/material.dart';
import 'front_card.dart';
import 'back_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class StudentCardScreen extends StatefulWidget {
  const StudentCardScreen( {Key? key}) : super(key: key);

  @override
  _StudentCardScreenState createState() => _StudentCardScreenState();
}

class _StudentCardScreenState extends State<StudentCardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFrontCard(),
                  _buildBackCard(),
                ],
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
        icon: Icon(Icons.arrow_back,
            color: backgroundColor, size: screenWidth * 0.08),
        onPressed: () => Navigator.of(context).pop(),
      ),
      right: IconButton(
        icon: Icon(Icons.help_outline,
            color: backgroundColor, size: screenWidth * 0.08),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0)),
                title: Center(
                  child: Text(
                    "Ajuda",
                    style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: mainColor),
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Esta é a sua carteira estudantil. Aqui você pode visualizar as informações importantes sobre sua matrícula e identificação.",
                      style: TextStyle(
                          color: messageTextColor,
                          fontSize: screenWidth * 0.032),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Na frente da carteira, você encontrará seu nome, o nome do curso e a modalidade (bacharelado, licenciatura, etc.). No verso, estão as informações de identificação e autenticação do aluno.",
                      style: TextStyle(
                          color: messageTextColor,
                          fontSize: screenWidth * 0.032),
                    ),
                  ],
                ),
                actions: [
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0)),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Ok",
                          style: TextStyle(
                              color: backgroundColor,
                              fontSize: screenWidth * 0.032)),
                    ),
                  ),
                ],
              );
            },
          );
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
            padding: EdgeInsets.all(0.04 * screenWidth),
            child:
                Icon(Icons.badge, size: screenHeight * 0.1, color: mainColor),
          ),
        ),
      ),
      top: Text("Carteira Estudantil",
          style:
              TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor)),
      bottom: Center(
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelColor: backgroundColor,
          unselectedLabelColor: Colors.greenAccent[100],
          indicatorColor: backgroundColor,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(
                child: Text("Frente",
                    style: TextStyle(fontSize: screenWidth * 0.035))),
            Tab(
                child: Text("Verso",
                    style: TextStyle(fontSize: screenWidth * 0.035))),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontCard() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FrontCard(), // Usando studentData corretamente
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackCard(), // Usando studentData corretamente
        ],
      ),
    );
  }
}
