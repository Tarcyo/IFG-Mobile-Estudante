import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/reusableWidgets/headerBuilder.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
      BuildContext context, double screenHeight, double screenWidth) {
    return HeaderBuilder(
      left: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: backgroundColor,
          size: screenWidth * 0.05,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      right: Icon(
        Icons.help_outline,
        color: Colors.transparent,
        size: screenWidth * 0.08,
      ),
      center: Container(
        height: screenHeight * 0.25,
        width: screenHeight * 0.25,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
        ),
        child: Center(
          child: Icon(
            Icons.map,
            size: screenHeight * 0.15,
            color: mainColor,
          ),
        ),
      ),
      top: Text(
        "Mapa do IFG",
        style: TextStyle(fontSize: screenWidth * 0.04, color: backgroundColor),
      ),
      bottom: SizedBox(
        width: 1,
      ),
    );
  }

  Widget _body(BuildContext context, double screenHeight, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'assets/images/Mapa.png',
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
