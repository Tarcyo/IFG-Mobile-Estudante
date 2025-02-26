import 'material_card.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
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
                  backgroundColor: Colors.transparent,
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
                        // Título com emoji
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
                        Text(
                          "📁 Arquivos e Recursos:\n"
                          "Aqui você pode acessar os arquivos e recursos disponibilizados pelos seus professores.\n\n"
                          "🗂 Organização dos Arquivos:\n"
                          "Cada arquivo é organizado verticalmente para facilitar a navegação. Você encontrará um grande ícone representando o tipo de arquivo e uma opção para abri-lo.\n\n"
                          "📝 Nome do Arquivo:\n"
                          "O nome do arquivo é exibido para identificar claramente o conteúdo.\n\n"
                          "📄 Tipo de Arquivo e Data:\n"
                          "Ao lado do nome, você verá o tipo de arquivo (documento, apresentação, planilha, etc.) e a data em que ele foi disponibilizado.",
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
              borderRadius: BorderRadius.all(Radius.circular(screenWidth * 1)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.book,
                    size: screenHeight * 0.1,
                    color: Colors.teal.shade900,
                  ),
                ],
              ),
            ),
          ),
        ),
        top: Text(
          "Material de aula",
          style: TextStyle(fontSize: screenWidth * 0.06, color: Colors.white),
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
