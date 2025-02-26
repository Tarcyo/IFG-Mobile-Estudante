import 'package:flutter/material.dart';

class GradePeriodCard extends StatelessWidget {
  final double activityMaxGrade;
  final String? myGrade;

  const GradePeriodCard({
    required this.activityMaxGrade,
    required this.myGrade,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    List<Color> gradientColors;
    IconData indicatorIcon;
    String gradeText;

    if (myGrade == null) {
      gradientColors = [
        Colors.blue.shade900,
        Colors.blue.shade600,
        Colors.blue.shade900,
      ];
      indicatorIcon = Icons.pending;
      gradeText = "Não concluída";
    } else {
      double gradeValue = double.parse(myGrade!);
      gradeText = "$myGrade / $activityMaxGrade";

      if (gradeValue < (activityMaxGrade * 0.6)) {
        gradientColors = [
          Colors.red.shade900,
          Colors.pink.shade600,
          Colors.red.shade900,
        ];
        indicatorIcon = Icons.warning;
      } else {
        gradientColors = [
          Colors.teal.shade900,
          Colors.green.shade600,
          Colors.teal.shade900,
        ];
        indicatorIcon = Icons.emoji_events;
      }
    }

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03,
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
                painter: PeriodCardPainter(),
              ),
            ),
            SizedBox(
              height: screenWidth * 0.35,
              width: screenWidth * 0.35,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      indicatorIcon,
                      color: Colors.white,
                      size: screenWidth * 0.15,
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      "Média Final",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      gradeText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.04,
                      ),
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
