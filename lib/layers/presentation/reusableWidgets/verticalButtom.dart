import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class VerticalButtom extends StatelessWidget {
  final String text;
  final IconData aboveIcon;
  final VoidCallback? onPressed;

  const VerticalButtom(
    this.text,
    this.aboveIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(right: 2),
      width: screenWidth * 0.19,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: focusBackgroundColor,
                  elevation: 1.5,
                  fixedSize: Size(screenWidth * 0.20, screenWidth * 0.20),
                  foregroundColor: onTapButtonColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      aboveIcon,
                      color: mainColor,
                      size: screenWidth * 0.08,
                    ),
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenWidth * 0.029,
                        color: messageTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
