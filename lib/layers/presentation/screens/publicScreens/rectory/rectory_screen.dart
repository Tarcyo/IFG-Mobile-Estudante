import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/url_launcher_helper.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/horizontal_regular_button_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/very_long_horizontal_button.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'rectory_message_screen.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;

class RectoryScreen extends StatelessWidget {
  RectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
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

  Widget _header(BuildContext context, screenWidth, screenHeight) {
    return HeaderBuilderWidget(
        left: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: screenWidth * 0.08,
          ),
          onPressed: () {
            Navigator.of(context).pop("");
          },
        ),
        right: Icon(
          Icons.help_outline,
          color: Colors.transparent,
          size: screenWidth * 0.08,
        ),
        center: Center(
          child: Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border:
                  Border.all(color: Colors.white, width: screenWidth * 0.0025),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.00125),
              child: Icon(
                Icons.assignment_ind_rounded,
                size: screenHeight * 0.1,
                color: Colors.teal.shade900,
              ),
            ),
          ),
        ),
        top: Center(
          child: Text(
            "Reitoria",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.06),
          ),
        ),
        bottom: SizedBox(
          width: 3,
        ));
  }

  Widget _body(BuildContext context, screenWidth, screenHeight) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.015,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  HorizontalButtonWidget(
                    'Mensagem \nda reitoria',
                    Icons.message,
                    onPressed: () async {
                      final String jsonData = await rootBundle
                          .loadString('assets/data/rectoryMessage.json');

                      final Map<String, dynamic> data = json.decode(jsonData);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RectoryMessageScreen(
                              data['mensagem'], data['nome do reitor']),
                        ),
                      );
                    },
                  ),
                ]),
                SizedBox(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.025,
                ),
                Row(
                  children: [
                    HorizontalButtonWidget(
                      'Localização',
                      Icons.room,
                      onPressed: () async {
                        await openWebPage(
                            "https://www.google.com/search?q=Oficial_IFG&ludocid=16607294534326213405&ibp=gwp;0,7&source=g.page.share");
                      },
                    ),
                    HorizontalButtonWidget(
                      'Equipe \ngestora',
                      Icons.groups,
                      onPressed: () async {
                        await openWebPage(
                            "http://ifg.edu.br/reitoria?showall=&start=1");
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.025,
                ),
                Row(
                  children: [
                    HorizontalButtonWidget(
                      'Facebook',
                      Icons.facebook,
                      onPressed: () async {
                        await openWebPage(
                            "https://web.facebook.com/IFG.oficial/?_rdc=1&_rdr");
                      },
                    ),
                    HorizontalButtonWidget(
                      'Contatos',
                      Icons.phone,
                      onPressed: () async {
                        await openWebPage(
                            "http://ifg.edu.br/contatos-a-instituicao/");
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * 0.1,
            height: screenHeight * 0.025,
          ),
          VeryLongHorizontalButtonWidget(
            "Página da reitoria",
            Icons.house,
            onPressed: () async {
              await openWebPage('https://www.ifg.edu.br/reitoria');
            },
          )
        ],
      ),
    );
  }
}
