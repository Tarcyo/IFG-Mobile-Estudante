import 'package:flutter/material.dart';

class ButtomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintTop = Paint()..color = Colors.white.withValues(alpha: 0.15);
    final pathTop = Path();
    pathTop.moveTo(0, size.height * 0.2);
    pathTop.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.1,
      size.width * 0.5,
      size.height * 0.25,
    );
    pathTop.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.4,
      0,
      size.height * 0.35,
    );
    pathTop.close();
    canvas.drawPath(pathTop, paintTop);

    final paintBottom = Paint()..color = Colors.white.withValues(alpha: 0.1);
    final pathBottom = Path();
    pathBottom.moveTo(size.width, size.height * 0.8);
    pathBottom.quadraticBezierTo(
      size.width * 0.7,
      size.height,
      size.width * 0.5,
      size.height * 0.85,
    );
    pathBottom.quadraticBezierTo(
      size.width * 0.9,
      size.height * 0.7,
      size.width,
      size.height * 0.8,
    );
    pathBottom.close();
    canvas.drawPath(pathBottom, paintBottom);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
