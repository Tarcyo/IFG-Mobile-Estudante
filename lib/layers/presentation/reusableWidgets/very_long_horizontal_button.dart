import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class VeryLongHorizontalButtonWidget extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final VoidCallback? onPressed;

  const VeryLongHorizontalButtonWidget(
    this.text,
    this.leftIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SizedBox(
        width: screenWidth * 0.8, 
        height: screenHeight * 0.1, 
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            foregroundColor: onTapButtonColor,
            backgroundColor: focusBackgroundColor,
            elevation: 1.5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(180), 
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              Icon(
                leftIcon,
                color: mainColor,
                size: screenHeight * 0.08, 
              ),
              SizedBox(width: screenWidth * 0.02), 
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: messageTextColor,
                  fontSize: screenHeight * 0.03,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
