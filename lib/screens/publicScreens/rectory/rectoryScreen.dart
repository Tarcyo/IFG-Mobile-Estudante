import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/horizontalButtom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/veryLongHorizontalButtom.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/horizontalBorderlessButtom.dart';
import 'rectoryMessageScreen.dart';
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

  Widget _header(BuildContext context, screenWidth, screenHeight) {
    return HeaderBuilder(
        left: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: backgroundColor,
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
              color: backgroundColor,
              border: Border.all(color: mainColor, width: screenWidth * 0.0025),
            ),
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.00125),
              child: Icon(
                Icons.assignment_ind_rounded,
                size: screenHeight * 0.1,
                color: mainColor,
              ),
            ),
          ),
        ),
        top: Center(
          child: Text(
            "Reitoria",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: backgroundColor,
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
      color: backgroundColor,
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
                  HorizontalBorderlessButtom(
                    'Mensagem \nda reitoria',
                    Icons.message,
                    onPressed: () async {
                      final String jsonData = await rootBundle
                          .loadString('assets/data/rectoryMessage.json');

                      final Map<String, dynamic> data = json.decode(jsonData);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RectoryMessageScreen(data['mensagem'],data['nome do reitor']),
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
                    HorizontalButtom(
                      'Localização',
                      Icons.room,
                      onPressed: () async {
                        final String url =
                            "https://www.google.com/search?q=Oficial_IFG&ludocid=16607294534326213405&ibp=gwp;0,7&source=g.page.share";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    HorizontalButtom(
                      'Equipe \ngestora',
                      Icons.groups,
                      onPressed: () async {
                        final String url =
                            "http://ifg.edu.br/reitoria?showall=&start=1";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
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
                    HorizontalButtom(
                      'Facebook',
                      Icons.facebook,
                      onPressed: () async {
                        final String url =
                            "https://web.facebook.com/IFG.oficial/?_rdc=1&_rdr";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    HorizontalButtom(
                      'Contatos',
                      Icons.phone,
                      onPressed: () async {
                        final String url =
                            "http://ifg.edu.br/contatos-a-instituicao/";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
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
          VeryLongHorizontalButtom(
            "Página da reitoria",
            Icons.house,
            onPressed: () async {
              final String url = 'https://www.ifg.edu.br/reitoria';
              final Uri uri = Uri.parse(url);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              } else {
                throw 'Could not launch $uri';
              }
            },
          )
        ],
      ),
    );
  }
}
