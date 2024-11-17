import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class AboutsScreen extends StatelessWidget {
  AboutsScreen({Key? key});

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
    return HeaderBuilder(
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
                      "É com imensa honra que apresento este aplicativo desenvolvido para o Instituto Federal de Goiás, uma instituição que tem desempenhado um papel fundamental na educação e formação de tantas mentes brilhantes. A oportunidade de contribuir para o avanço tecnológico e educacional desta instituição é um marco significativo em minha jornada.\n\nQuero expressar minha profunda gratidão aos orixás e guias espirituais, que me guiaram e iluminaram meu caminho durante todo este processo. Agradeço também, de todo o coração, à minha psicóloga e terapeuta, Doutora Eleusa Pacífico, por seu apoio incansável e por me ajudar a manter o equilíbrio necessário para concluir este projeto.\n\nAgradeço à DTI, especialmente aos professores Daniel Canedo e Leonardo, pela disponibilidade das APIs essenciais. Sem essas ferramentas, a conclusão deste projeto não teria sido possível, e sou eternamente grato por sua generosidade e colaboração.\n\nPor fim, uma expressão de profunda e intensa gratidão ao meu orientador, Leandro Alexandre Freitas. Seu apoio constante em todo o processo foi crucial para meu crescimento e aprendizado. Ele não só me orientou, mas também está me ajudando a alcançar meu sonho de seguir na área acadêmica e me tornar professor. Leandro, sua dedicação e confiança em meu potencial são inestimáveis, e sou extremamente grato por tê-lo como mentor nesta jornada.",
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
