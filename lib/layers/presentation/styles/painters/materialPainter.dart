import 'package:flutter/material.dart';

class MaterialPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintTop = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..style = PaintingStyle.fill;

    final pathTop = Path();
    pathTop.moveTo(0, size.height * 0.2);
    pathTop.quadraticBezierTo(
      size.width * 0.5,
      0,
      size.width,
      size.height * 0.2,
    );
    pathTop.lineTo(size.width, 0);
    pathTop.lineTo(0, 0);
    pathTop.close();

    canvas.drawPath(pathTop, paintTop);

    final paintBottom = Paint()
      ..color = Colors.white.withValues(alpha: 0.15)
      ..style = PaintingStyle.fill;

    final pathBottom = Path();
    pathBottom.moveTo(0, size.height);
    pathBottom.lineTo(0, size.height * 0.8);
    pathBottom.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width,
      size.height * 0.8,
    );
    pathBottom.lineTo(size.width, size.height);
    pathBottom.close();

    canvas.drawPath(pathBottom, paintBottom);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
