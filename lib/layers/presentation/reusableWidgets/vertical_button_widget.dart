import 'package:flutter/material.dart';

class VerticalButtonWidget extends StatelessWidget {
  final String text;
  final IconData aboveIcon;
  final VoidCallback? onPressed;

  const VerticalButtonWidget(
    this.text,
    this.aboveIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonSize = screenWidth * 0.20;
    final borderRadiusValue = buttonSize / 2;

    return Container(
      margin: const EdgeInsets.only(right: 2),
      width: screenWidth * 0.19,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: buttonSize,
            height: buttonSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadiusValue),
              gradient: LinearGradient(
                colors: [
                  Colors.teal.shade900,
                  Colors.green.shade600,
                  Colors.teal.shade900,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(4, 4),
                ),
              ],
            ),
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors
                    .transparent, // Fundo transparente para exibir o degradê
                elevation:
                    0, // Remove elevação extra para não sobrepor a sombra do Container
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    aboveIcon,
                    color: Colors.white,
                    size: screenWidth * 0.08,
                  ),
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: screenWidth * 0.029,
                      color: Colors.white,
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
