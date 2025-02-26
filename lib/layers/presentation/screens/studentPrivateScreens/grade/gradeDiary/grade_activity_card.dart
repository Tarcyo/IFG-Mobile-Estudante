import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/gradePainter.dart';

class GradeActivityCard extends StatelessWidget {
  final String activityName;
  final String activityType;
  final int activityMaxGrade;
  final String? myGrade;
  final String activtyDate;

  const GradeActivityCard({
    required this.activityName,
    required this.activityType,
    required this.activityMaxGrade,
    required this.myGrade,
    required this.activtyDate,
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
      gradeText = "Não Lançada";
    } else {
      double gradeValue = double.tryParse(myGrade!) ?? 0.0;
      gradeText = "$myGrade / $activityMaxGrade";
      if (gradeValue < activityMaxGrade * 0.6) {
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

    Widget leftContent = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          indicatorIcon,
          color: Colors.white,
          size: screenWidth * 0.1,
        ),
        SizedBox(height: screenWidth * 0.02),
        Text(
          "Nota:",
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          gradeText,
          style: TextStyle(
            color: Colors.white,
            fontSize: screenWidth * 0.035,
          ),
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03, horizontal: screenWidth * 0.04),
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
          // Conteúdo principal do cartão
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: screenWidth * 0.25,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(screenWidth * 0.05),
                ),
                child: leftContent,
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildInfoRow(
                      Icons.science,
                      activityName,
                      Colors.white,
                      screenWidth,
                    ),
                    SizedBox(height: screenWidth * 0.015),
                    _buildInfoRow(
                      Icons.book,
                      activityType,
                      Colors.white70,
                      screenWidth,
                    ),
                    SizedBox(height: screenWidth * 0.015),
                    _buildInfoRow(
                      Icons.calendar_month,
                      activtyDate,
                      Colors.white70,
                      screenWidth,
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

  Widget _buildInfoRow(
      IconData icon, String text, Color color, double screenWidth) {
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: screenWidth * 0.05,
        ),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: screenWidth * 0.038,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
