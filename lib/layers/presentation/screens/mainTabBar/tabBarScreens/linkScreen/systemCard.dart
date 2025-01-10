import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class SystemCard extends StatelessWidget {
  final String _systemName;
  final String _linkToTheSystem;

  SystemCard(
    this._systemName,
    this._linkToTheSystem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.025),
      ),
      margin: EdgeInsets.all(screenWidth * 0.025),
      child: GestureDetector(
        onTap: () async {
          final Uri uri = Uri.parse(_linkToTheSystem);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launch $uri';
          }
        },
        child: Material(
          elevation: 4, 
          borderRadius: BorderRadius.circular(45), // Para alinhar com o ClipRRect
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Stack(
              children: [
                Image.asset(
                  "assets/images/$_systemName.jpg",
                  height: screenWidth * 0.4,
                  width: screenWidth * 0.4,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: screenWidth * 0.015,
                  left: screenWidth * 0.088,
                  child: Container(
                    color: bannerColor,
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    child: Text(
                      _systemName,
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