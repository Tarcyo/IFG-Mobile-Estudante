import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RoundedButtonWidget(
    this.text, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(right: 10),
      width: screenWidth * 0.3,
      height: screenWidth * 0.12,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.3),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: mainColor,
          elevation: 1.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 180),
          ),
          foregroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: backgroundColor, fontSize: screenWidth * 0.05),
            ),
          ],
        ),
      ),
    );
  }
}
