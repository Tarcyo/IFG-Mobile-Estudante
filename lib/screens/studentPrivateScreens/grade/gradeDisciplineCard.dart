import 'package:flutter/material.dart';
import 'gradeDiary/gradeDiaryScreen.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class GradeDisciplineCard extends StatelessWidget {
  final dynamic _data;
  const GradeDisciplineCard(
    this._data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GradeDiaryScreen(_data)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        height: screenHeight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(screenWidth * 0.05),
              ),
              child: Center(
                child: Icon(
                  Icons.school,
                  color: backgroundColor,
                  size: screenWidth * 0.09,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Expanded(
              child: Text(
                _data['disciplina'].substring(_data['disciplina'].indexOf(' - ')+2),
                   
                style:
                    TextStyle(fontSize: screenWidth * 0.045, color: mainColor),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: mainColor,
              size: screenWidth * 0.043,
            ),
          ],
        ),
      ),
    );
  }
}
