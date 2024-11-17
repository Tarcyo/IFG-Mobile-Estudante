import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/horizontalButtom.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/veryLongHorizontalButtom.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class CampusScreen extends StatelessWidget {
  final Map<String, dynamic> _data;
  final String _city;

  CampusScreen(this._city, this._data, {super.key});

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
          Icons.arrow_back,
          color: backgroundColor,
          size: screenWidth * 0.08,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      right: Icon(
        Icons.help_outline,
        color: Colors.transparent,
        size: screenWidth * 0.08,
      ),
      center: Container(
        height: screenHeight * 0.15,
        width: screenHeight * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(180),
          border: Border.all(
            color: backgroundColor,
            width: 1,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/' + _city + '.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      top: Center(
        child: Text(
          _city,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: backgroundColor,
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.06),
        ),
      ),
      bottom: const SizedBox(width: 1),
    );
  }

  Widget _body(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: screenWidth * 0.03,
            height: screenHeight * 0.03,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                color: focusBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  width: screenWidth * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Descrição",
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.055),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: screenWidth * 0.015,
                            height: screenWidth * 0.015,
                          ),
                          Text(
                            _data["descrição"],
                            style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.032),
                          )
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Center(
                child: Column(
              children: [
                Row(
                  children: [
                    HorizontalButtom(
                      'Calendário\nAcadêmico',
                      Icons.calendar_month,
                      onPressed: () async {
                        final String url =
                            "https://www.ifg.edu.br/calendario-academico";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    HorizontalButtom(
                      'Lista\n De Cursos',
                      Icons.list_alt,
                      onPressed: () async {
                        final String url = "http://cursos.ifg.edu.br";
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
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    HorizontalButtom(
                      'Telefones',
                      Icons.phone,
                      onPressed: () async {
                        final String url = 'http://www.ifg.edu.br/' +
                            _removerAcentosParaUrl(_city) +
                            "/contato";
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    HorizontalButtom(
                      'Localização',
                      Icons.location_on,
                      onPressed: () async {
                        final String url = _data['localização'];
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
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    HorizontalButtom(
                      'Facebook',
                      Icons.facebook,
                      onPressed: () async {
                        final String url = _data['facebook'];
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $uri';
                        }
                      },
                    ),
                    HorizontalButtom(
                      'Instagram',
                      Icons.camera_alt,
                      onPressed: () async {
                        final String url = _data['instagram'];
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
            )),
          ),
          SizedBox(height: screenHeight * 0.015),
          VeryLongHorizontalButtom(
            "Página do Campus",
            Icons.house,
            onPressed: () async {
              final String url =
                  'http://www.ifg.edu.br/' + _removerAcentosParaUrl(_city);
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

  String _removerAcentosParaUrl(String texto) {
    Map<String, String> mapaAcentos = {
      'á': 'a',
      'à': 'a',
      'ã': 'a',
      'â': 'a',
      'ä': 'a',
      'é': 'e',
      'è': 'e',
      'ê': 'e',
      'ë': 'e',
      'í': 'i',
      'ì': 'i',
      'î': 'i',
      'ï': 'i',
      'ó': 'o',
      'ò': 'o',
      'õ': 'o',
      'ô': 'o',
      'ö': 'o',
      'ú': 'u',
      'ù': 'u',
      'û': 'u',
      'ü': 'u',
      'ç': 'c',
    };

    texto = texto.toLowerCase();

    mapaAcentos.forEach((key, value) {
      texto = texto.replaceAll(key, value);
    });

    texto = texto.replaceAll(RegExp(r'\s+'), '');

    return texto;
  }
}
