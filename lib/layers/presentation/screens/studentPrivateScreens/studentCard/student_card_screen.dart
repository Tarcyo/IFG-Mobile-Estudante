import 'package:flutter/material.dart';
import 'front_card.dart';
import 'back_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';

class StudentCardScreen extends StatefulWidget {
  const StudentCardScreen({Key? key}) : super(key: key);

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
        backgroundColor: Colors.white,
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
            color: Colors.white, size: screenWidth * 0.08),
        onPressed: () => Navigator.of(context).pop(),
      ),
      right: IconButton(
        icon: Icon(Icons.help_outline,
            color: Colors.white, size: screenWidth * 0.08),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors
                    .transparent, // Fundo transparente para design personalizado
                elevation: 0,
                contentPadding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
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
                      // Título sem emoji
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
                      // Conteúdo com emojis no texto
                      Text(
                        "💳 Carteira Estudantil:\n"
                        "Esta é a sua carteira estudantil. Aqui você pode visualizar as informações importantes sobre sua matrícula e identificação.\n\n"
                        "👤 Frente da Carteira:\n"
                        "Na frente, você encontrará seu nome, o nome do curso e a modalidade (bacharelado, licenciatura, etc.).\n\n"
                        "🔑 Verso da Carteira:\n"
                        "No verso, estão as informações de identificação e autenticação do aluno, incluindo um QR code para acesso dentro e fora da instituição.",
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
                        onPressed: () => Navigator.of(context).pop(),
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
          );
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
            padding: EdgeInsets.all(0.04 * screenWidth),
            child:
                Icon(Icons.badge, size: screenHeight * 0.1, color: Colors.teal.shade900),
          ),
        ),
      ),
      top: Text("Carteira Estudantil",
          style:
              TextStyle(fontSize: screenWidth * 0.06, color: Colors.white)),
      bottom: Center(
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: _tabController,
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.greenAccent[100],
          indicatorColor: Colors.white,
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
