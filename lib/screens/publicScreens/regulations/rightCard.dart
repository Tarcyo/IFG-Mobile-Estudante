import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class RightCard extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const RightCard(
    this.text, {
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(screenWidth * 180),
              ),
              child: Icon(
                Icons.task,
                color: backgroundColor,
                size: MediaQuery.of(context).size.width * 0.09,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              child: Text(
                text,
                style:
                    TextStyle(fontSize: screenWidth * 0.04, color: mainColor),
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
