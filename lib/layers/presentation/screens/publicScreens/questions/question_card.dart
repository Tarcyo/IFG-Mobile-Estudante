import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class QuestionCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const QuestionCard(
    this.text, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
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
                borderRadius: BorderRadius.circular(180),
              ),
              child: Icon(
                Icons.question_mark,
                color: backgroundColor,
                size: screenWidth * 0.09,
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: screenWidth * 0.04, color: mainColor),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: mainColor,
              size: screenWidth * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
