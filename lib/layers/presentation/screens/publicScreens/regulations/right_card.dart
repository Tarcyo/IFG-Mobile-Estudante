import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/buttomPainter.dart';

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

    final List<Color> gradientColors = [
      Colors.teal.shade900,
      Colors.green.shade700,
      Colors.teal.shade900,
    ];

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical:
              screenWidth * 0.015,
          horizontal: screenWidth * 0.04,
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            stops: const [0.1, 0.5, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(5, 7),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(
                painter: ButtomPainter(),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.task,
                      color: Colors.white,
                      size: screenWidth * 0.09,
                    ),
                  ),
                ),
                SizedBox(
                    width: screenWidth * 0.05),
                // Texto do cartão
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: screenWidth * 0.043,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


