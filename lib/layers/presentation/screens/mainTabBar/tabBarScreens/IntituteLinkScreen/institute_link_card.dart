import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/url_launcher_helper.dart';

class InstitutwLinkScreenCard extends StatelessWidget {
  final String systemName;
  final String linkToTheSystem;

  const InstitutwLinkScreenCard(
    this.systemName,
    this.linkToTheSystem, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardSize = screenWidth * 0.35;
    final borderRadius = BorderRadius.circular(screenWidth * 0.025);

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.025),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: Material(
        elevation: 4,
        borderRadius: borderRadius,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () async {
            openWebPage(linkToTheSystem);
          },
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Stack(
              children: [
                // Imagem com dimensões originais
                Image.asset(
                  "assets/images/$systemName.jpg",
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
                    padding: EdgeInsets.all(screenWidth * 0.01),
                    decoration: BoxDecoration(
                      color: Colors.black87.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(screenWidth * 0.015),
                    ),
                    child: Text(
                      systemName,
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
