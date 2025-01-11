import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/remove_special_icons_for_URL_helper.dart';
import 'package:ifg_mobile_estudante/core/utils/url_launcher_helper.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/horizontal_regular_button_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/very_long_horizontal_button.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

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
    return HeaderBuilderWidget(
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
        height: screenHeight * 0.2,
        width: screenHeight * 0.2,
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
                    HorizontalButtonWidget(
                      'Calendário\nAcadêmico',
                      Icons.calendar_month,
                      onPressed: () async {
                        await openWebPage(
                            "https://www.ifg.edu.br/calendario-academico");
                      },
                    ),
                    HorizontalButtonWidget(
                      'Lista\n De Cursos',
                      Icons.list_alt,
                      onPressed: () async {
                        await openWebPage("http://cursos.ifg.edu.br");
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    HorizontalButtonWidget(
                      'Telefones',
                      Icons.phone,
                      onPressed: () async {
                        await openWebPage('http://www.ifg.edu.br/' +
                            removerAcentosParaUrl(_city) +
                            "/contato");
                      },
                    ),
                    HorizontalButtonWidget(
                      'Localização',
                      Icons.location_on,
                      onPressed: () async {
                        await openWebPage(_data['localização']);
                      },
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.015),
                Row(
                  children: [
                    HorizontalButtonWidget(
                      'Facebook',
                      Icons.facebook,
                      onPressed: () async {
                        await openWebPage(_data['facebook']);
                      },
                    ),
                    HorizontalButtonWidget(
                      'Instagram',
                      Icons.camera_alt,
                      onPressed: () async {
                        await openWebPage(_data['instagram']);
                      },
                    ),
                  ],
                ),
              ],
            )),
          ),
          SizedBox(height: screenHeight * 0.015),
          VeryLongHorizontalButtonWidget(
            "Página do Campus",
            Icons.house,
            onPressed: () async {
              await openWebPage(
                  'http://www.ifg.edu.br/' + removerAcentosParaUrl(_city));
            },
          )
        ],
      ),
    );
  }


}
