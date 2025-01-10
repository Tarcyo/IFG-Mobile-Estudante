import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class VeryLongHorizontalButtom extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final VoidCallback? onPressed;

  const VeryLongHorizontalButtom(
    this.text,
    this.leftIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        width: screenWidth * 0.95,
        child: FractionallySizedBox(
          widthFactor: 0.9,
          child: Stack(
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  foregroundColor: onTapButtonColor,
                  backgroundColor: focusBackgroundColor,
                  elevation: 1.5,
                ),
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.0375),
                  child: Row(
                    children: [
                      Icon(
                        leftIcon,
                        color: mainColor,
                        size: screenWidth * 0.1,
                      ),
                      SizedBox(width: screenWidth * 0.0375),
                      Text(
                        text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: messageTextColor,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: screenWidth * 0.1375,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
