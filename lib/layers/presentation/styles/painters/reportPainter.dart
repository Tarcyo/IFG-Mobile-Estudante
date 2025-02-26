
import 'package:flutter/material.dart';

class ReportPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintTop = Paint()..color = Colors.white.withValues(alpha: 0.15);
    final pathTop = Path();
    pathTop.moveTo(0, size.height * 0.3);
    pathTop.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.25,
      size.width * 0.5,
      size.height * 0.35,
    );
    pathTop.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.45,
      size.width,
      size.height * 0.4,
    );
    pathTop.lineTo(size.width, 0);
    pathTop.lineTo(0, 0);
    pathTop.close();
    canvas.drawPath(pathTop, paintTop);

    final paintBottom = Paint()..color = Colors.black.withValues(alpha: 0.05);
    final pathBottom = Path();
    pathBottom.moveTo(0, size.height);
    pathBottom.lineTo(0, size.height * 0.85);
    pathBottom.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.95,
      size.width,
      size.height * 0.85,
    );
    pathBottom.lineTo(size.width, size.height);
    pathBottom.close();
    canvas.drawPath(pathBottom, paintBottom);

    final circlePaint = Paint()..color = Colors.white.withValues(alpha: 0.1);
    const int numCircles = 7;
    for (int i = 0; i < numCircles; i++) {
      double dx = size.width * (i / (numCircles - 1));
      double dy = size.height * 0.5 +
          10 * (i.isEven ? 1 : -1); 
      canvas.drawCircle(Offset(dx, dy), 3, circlePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
