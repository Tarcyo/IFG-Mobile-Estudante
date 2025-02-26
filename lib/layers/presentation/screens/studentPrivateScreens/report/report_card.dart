import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/reportPainter.dart';

class ReportCard extends StatelessWidget {
  final String discipline;
  final String teacher;
  final String situation;
  final double grade;
  final int absences;
  final int maxAbsences;

  const ReportCard({
    required this.discipline,
    required this.teacher,
    required this.grade,
    required this.absences,
    required this.maxAbsences,
    required this.situation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double attendancePercentage =
        ((maxAbsences - absences) / maxAbsences) * 100;
    bool isLowGrade = grade < 6.0;
    bool isLowAttendance = attendancePercentage < 85;

    IconData iconeSituacao;
    List<Color> gradientColors;

    if (situation == 'Cursando') {
      iconeSituacao = Icons.pending;
      gradientColors = [
        Colors.blue.shade900,
        Colors.lightBlue.shade500,
        Colors.blue.shade900
      ];
    } else if (!isLowGrade && !isLowAttendance) {
      iconeSituacao = Icons.verified;
      gradientColors = [
        Colors.teal.shade900,
        Colors.green.shade600,
        Colors.teal.shade900
      ];
    } else {
      iconeSituacao = Icons.warning;
      gradientColors = [
        Colors.red.shade900,
        Colors.pink.shade300,
        Colors.red.shade900
      ];
    }

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
            child: Opacity(
              opacity: 1,
              child: CustomPaint(
                painter: ReportPainter(),
              ),
            ),
          ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconeSituacao,
                      color: Colors.white,
                      size: screenWidth * 0.1,
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      situation,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildInfoRow(
                        Icons.school, discipline, Colors.white, screenWidth),
                    _buildInfoRow(Icons.person, 'Prof. $teacher',
                        Colors.white70, screenWidth),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoRow(Icons.emoji_events,
                              'Nota: $grade', Colors.white70, screenWidth),
                        ),
                        if (isLowGrade) ...[
                          SizedBox(width: screenWidth * 0.01),
                          Icon(
                            Icons.warning,
                            color: Colors.yellow,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: _buildInfoRow(
                              Icons.event_busy,
                              'Faltas: $absences (máx $maxAbsences)',
                              Colors.white70,
                              screenWidth),
                        ),
                        if (isLowAttendance) ...[
                          SizedBox(width: screenWidth * 0.01),
                          Icon(
                            Icons.warning,
                            color: Colors.yellow,
                            size: screenWidth * 0.05,
                          ),
                        ],
                      ],
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

