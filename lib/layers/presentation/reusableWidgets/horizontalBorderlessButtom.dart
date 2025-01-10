import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class HorizontalBorderlessButtom extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final VoidCallback? onPressed;

  const HorizontalBorderlessButtom(
    this.text,
    this.leftIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: screenWidth * 0.44,
      height: screenHeight * 0.076,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: focusBackgroundColor,
          elevation: 1.5,
          shadowColor: Colors.black.withOpacity(0.25),
          foregroundColor: onTapButtonColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: screenHeight * 0.08, 
                  width: screenHeight * 0.08, 
                  decoration: BoxDecoration(
                    color: mainColor,
                    shape: BoxShape.circle, 
                  ),
                  child: Icon(
                    leftIcon,
                    color: backgroundColor,
                    size: screenWidth * 0.06,
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.032,
                        color: messageTextColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: mainColor,
              size: screenHeight * 0.025, 
            ),
          ],
        ),
      ),
    );
  }
}
