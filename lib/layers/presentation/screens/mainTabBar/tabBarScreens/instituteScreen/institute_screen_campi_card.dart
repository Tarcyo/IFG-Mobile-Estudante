import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:ifg_mobile_estudante/layers/presentation/screens/mainTabBar/tabBarScreens/instituteScreen/campus_screen.dart';

class CampiCard extends StatelessWidget {
  final String city;

  const CampiCard(
    this.city, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth * 0.4;
    final borderRadius = BorderRadius.circular(screenWidth * 0.025);

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      child: Material(
        elevation: 4,
        borderRadius: borderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () async {
            final String jsonData =
                await rootBundle.loadString('assets/data/campi.json');
            final Map<String, dynamic> data = json.decode(jsonData);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CampusScreen(city, data["campus"][city]),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                // Imagem de fundo
                Image.asset(
                  "assets/images/$city.jpg",
                  height: cardSize,
                  width: cardSize,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: cardSize,
                  width: cardSize,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.1),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenWidth * 0.015,
                  left: screenWidth * 0.088,
                  child: Container(
                    padding: EdgeInsets.all(screenWidth * 0.015),
                    decoration: BoxDecoration(
                      color: Colors.black54.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Text(
                      city,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3,
                            color: Colors.black38,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
