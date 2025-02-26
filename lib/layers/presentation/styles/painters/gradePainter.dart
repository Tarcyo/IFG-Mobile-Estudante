import 'package:flutter/material.dart';
class PeriodCardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintTop = Paint()..color = Colors.white.withValues(alpha: 0.15);
    final pathTop = Path();
    pathTop.moveTo(0, size.height * 0.2);
    pathTop.quadraticBezierTo(
      size.width * 0.3,
      0,
      size.width * 0.55,
      size.height * 0.15,
    );
    pathTop.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.3,
      size.width,
      size.height * 0.2,
    );
    pathTop.lineTo(size.width, 0);
    pathTop.lineTo(0, 0);
    pathTop.close();
    canvas.drawPath(pathTop, paintTop);
    final circlePaint = Paint()..color = Colors.black.withValues(alpha: 0.1);
    canvas.drawCircle(
      Offset(size.width * 0.8, size.height * 0.8),
      size.width * 0.1,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
