import 'package:flutter/material.dart';
class HorizontalButtonWidget extends StatelessWidget {
  final String text;
  final IconData leftIcon;
  final VoidCallback? onPressed;

  const HorizontalButtonWidget(
    this.text,
    this.leftIcon, {
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: screenWidth * 0.4,
      height: screenWidth * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
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
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: screenWidth * 0.035),
            Icon(
              leftIcon,
              color: Colors.white,
              size: screenWidth * 0.12, // Ícone maior
            ),
            SizedBox(width: screenWidth * 0.035),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.035, // Texto um pouco maior
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                      color: Colors.black.withValues(alpha: 0.4),
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

