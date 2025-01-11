import 'material_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

class MaterialScreen extends StatefulWidget {
  final String disciplineName;
  MaterialScreen({required this.disciplineName, Key? key}) : super(key: key);

  @override
  _MaterialScreenState createState() => _MaterialScreenState();
}

class _MaterialScreenState extends State<MaterialScreen> {
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

  Widget _header(BuildContext context, screenWidth, screenHeight) {
    return HeaderBuilderWidget(
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
                        "Aqui você pode acessar os arquivos e recursos disponibilizados pelos seus professores.\n\nCada arquivo é organizado verticalmente para facilitar a navegação. Você encontrará um grande ícone representando o tipo de arquivo e uma opção para abrir o arquivo.\n\n O nome do arquivo é exibido para identificar claramente o conteúdo.\n\n Ao lado do nome do arquivo, você verá o tipo de arquivo, que pode ser um documento, uma apresentação, uma planilha, entre outro e data em que o arquivo foi disponibilizado.",
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
              borderRadius: BorderRadius.all(Radius.circular(screenWidth * 1)),
              color: backgroundColor,
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
          style:
              TextStyle(fontSize: screenWidth * 0.06, color: backgroundColor),
        ),
        bottom: SizedBox(
          width: 1,
        ));
  }

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return Container(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".mp4",
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".pdf",
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".jar",
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".mp4",
          ),
          SizedBox(
            height: screenWidth * 0.05,
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".mp4",
          ),
          SizedBox(
            height: screenWidth * 0.05,
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".mp4",
          ),
          MaterialCard(
            materialName: "Revisão Prova",
            activityType: "Documento",
            uploadDate: "03/01/2023",
            fileExtension: ".mp4",
          ),
        ],
      ),
    );
  }
}
