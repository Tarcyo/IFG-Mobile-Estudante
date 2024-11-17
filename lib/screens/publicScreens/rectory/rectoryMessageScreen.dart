import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class RectoryMessageScreen extends StatelessWidget {
  final String _mesage;
  final String _rectorName;
  RectoryMessageScreen(this._mesage, this._rectorName, {Key? key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: [
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

  Widget _body(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: const EdgeInsets.all(3),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.01),
          Center(
            child: Card(
              color: focusBackgroundColor,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(screenWidth * 0.045),
                    width: screenHeight * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: screenWidth * 0.01),
                        Center(
                          child: Container(
                            height: screenWidth * 0.4,
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/images/reitor(a).jpg'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.015),
                        Text(
                          _mesage,
                          style: TextStyle(
                              fontSize: screenWidth * 0.0333,
                              color: messageTextColor),
                        ),
                        Center(
                          child: Column(
                            children: [
                              Text(
                                _rectorName,
                                style: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.04),
                              ),
                              Text(
                                "Reitoria do IFG",
                                style: TextStyle(
                                    color: messageTextColor,
                                    fontSize: screenWidth * 0.033),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: screenWidth * 0.015),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8.0,
                    left: 8.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: mainColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
