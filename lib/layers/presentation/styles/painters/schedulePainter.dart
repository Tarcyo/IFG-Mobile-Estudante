import 'package:flutter/material.dart';

class SchedulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint topPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.15),
          Colors.white.withValues(alpha: 0.0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final Path topPath = Path();
    topPath.moveTo(0, size.height * 0.25);
    topPath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.05,
      size.width,
      size.height * 0.25,
    );
    topPath.lineTo(size.width, 0);
    topPath.lineTo(0, 0);
    topPath.close();
    canvas.drawPath(topPath, topPaint);

    final Paint bottomPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.1),
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final Path bottomPath = Path();
    bottomPath.moveTo(0, size.height);
    bottomPath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.85,
      size.width,
      size.height,
    );
    bottomPath.lineTo(size.width, size.height);
    bottomPath.lineTo(0, size.height);
    bottomPath.close();
    canvas.drawPath(bottomPath, bottomPaint);

    final Paint linePaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Path linePath = Path();
    linePath.moveTo(0, size.height * 0.5);
    linePath.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.45,
      size.width,
      size.height * 0.5,
    );
    canvas.drawPath(linePath, linePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
