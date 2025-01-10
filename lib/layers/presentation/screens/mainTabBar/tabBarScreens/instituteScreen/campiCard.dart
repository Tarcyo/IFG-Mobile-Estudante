import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:ifg_mobile_estudante/layers/presentation/screens/mainTabBar/tabBarScreens/instituteScreen/campusScreen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class CampiCard extends StatelessWidget {
  final String _city;

  CampiCard(
    this._city, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.05),
      child: GestureDetector(
        onTap: () async {
          final String jsonData =
              await rootBundle.loadString('assets/data/campi.json');

          final Map<String, dynamic> data = json.decode(jsonData);

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CampusScreen(_city, data["campus"][_city])),
          );
        },
        child: Material(
          elevation: 4, 
          borderRadius:
              BorderRadius.circular(45), // Para alinhar com o ClipRRect
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/" + _city + ".jpg",
                  height: screenWidth * 0.4,
                  width: screenWidth * 0.4,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Container(
                    color: bannerColor,
                    padding: EdgeInsets.all(screenWidth * 0.015),
                    child: Text(
                      _city,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: Colors.white,
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
