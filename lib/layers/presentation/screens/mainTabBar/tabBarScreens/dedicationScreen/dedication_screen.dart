import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class DedicationScreen extends StatelessWidget {
  DedicationScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: _body(context, screenWidth, screenHeight)),
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
        icon: Icon(
          Icons.logout,
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
                      "Atenção",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ],
                ),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Deseja realmente sair?",
                      style: TextStyle(
                        color: messageTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          "Sim",
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 13,
                          ),
                        ),
                      ),
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
                          "Não",
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: 13,
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
                      "Esta tela contém os créditos e a dedicatória do aplicativo",
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
                            color: Colors.white,
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
            border: Border.all(color: mainColor, width: screenWidth * 0.0025),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.00125),
            child: Icon(
              Icons.workspace_premium,
              size: screenHeight * 0.1,
              color: mainColor,
            ),
          ),
        ),
      ),
      top: Text(
        "Dedicatória",
        style: TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
      ),
      bottom: const SizedBox(width: 1),
    );
  }

  Widget _body(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.01),
          Center(
            child: Card(
              color: focusBackgroundColor,
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.045),
                width: screenHeight * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenWidth * 0.044),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Tarcyo Guilherme Maia Borges",
                            style: TextStyle(
                                color: mainColor, fontSize: screenWidth * 0.05),
                          ),
                          Text(
                            "Programador do aplicativo",
                            style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.033),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.044),
                    Text(
                      "Com imensa honra e gratidão, apresento este aplicativo desenvolvido para o Instituto Federal de Goiás, uma instituição que desempenha um papel essencial na formação educacional e no desenvolvimento de tantas mentes brilhantes. Contribuir para o avanço tecnológico e educacional desta renomada entidade é, para mim, um marco significativo e uma realização pessoal profunda.\n\nGostaria de expressar minha sincera gratidão aos orixás, pretos velhos, exus e todos os maravilhosos guias espirituais do Reino da Paz de Oxalá. Sua proteção e orientação iluminaram meu caminho e fortaleceram minha fé ao longo desta jornada. Cada passo dado foi inspirado por essa força maior, que me torna mais resiliente a cada dia.\n\nAos meus pais, dedico minha mais profunda admiração e carinho. Vocês foram minha base, meu suporte e minha inspiração. A educação, o amor e os valores que me transmitiram são os alicerces de tudo o que sou e de tudo o que ainda sonho me tornar.\n\nAos meus colegas de jornada, próximos ou distantes, sou grato por cada oportunidade de aprendizado e convivência. Conhecer suas histórias, personalidades e opiniões foi uma experiência enriquecedora, que me revelou a beleza e a complexidade da diversidade humana.\n\nQuero destacar, especialmente, meu amigo e colega Rodrigo Eduardo. Sua maturidade, racionalidade e apoio constante foram fundamentais para minha caminhada. Você nunca desistiu de mim, e sua amizade inspira o meu desenvolvimento pessoal e profissional.\n\nDeixo também meu agradecimento mais sincero à minha psicóloga e terapeuta, Dra. Eleusa Pacífico. Sua dedicação e orientação foram pilares que me sustentaram nos momentos mais desafiadores, permitindo que eu mantivesse o equilíbrio emocional necessário para concluir este projeto.\n\nAgradeço de coração à equipe da D.T.I, em especial aos professores Daniel Canedo e Leonardo, pela generosidade em disponibilizar as APIs essenciais ao desenvolvimento deste trabalho. Sem o apoio técnico e a colaboração de vocês, este projeto não teria se concretizado.\n\nPor fim, manifesto minha profunda gratidão ao meu orientador, Leandro Alexandre Freitas. Sua orientação atenciosa, confiança no meu potencial e dedicação inabalável foram determinantes para meu crescimento acadêmico e pessoal. Mais do que um mentor, você é uma inspiração, e sou imensamente grato por tê-lo ao meu lado nesta trajetória. Sua presença é um farol que ilumina meu sonho de seguir na área acadêmica e me tornar professor.\n\nA todos, meu mais sincero muito obrigado!",
                      style: TextStyle(
                          fontSize: screenWidth * 0.032,
                          color: messageTextColor),
                    ),
                    SizedBox(height: screenWidth * 0.015),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
