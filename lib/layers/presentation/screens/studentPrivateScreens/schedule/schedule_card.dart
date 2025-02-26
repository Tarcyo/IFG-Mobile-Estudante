import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/schedulePainter.dart';

class ScheduleCard extends StatelessWidget {
  final String begin;
  final String end;
  final String discipline;
  final String teacher;
  final String classroom;

  const ScheduleCard({
    required this.begin,
    required this.end,
    required this.discipline,
    required this.teacher,
    required this.classroom,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenWidth * 0.03, horizontal: screenWidth * 0.04),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.teal.shade900,
            Colors.green.shade600,
            Colors.teal.shade900,
          ],
          stops: const [0.1, 0.5, 0.9],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(screenWidth * 0.05),
        boxShadow: [
          BoxShadow(
            color: Colors.lightGreenAccent.withValues(alpha: 0.4),
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
                painter: SchedulePainter(),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
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
                      Icons.schedule,
                      color: Colors.white,
                      size: screenWidth * 0.1,
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Text(
                      '$begin - $end',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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
                    SizedBox(height: screenWidth * 0.015),
                    _buildInfoRow(Icons.person, 'Prof. $teacher',
                        Colors.white70, screenWidth),
                    SizedBox(height: screenWidth * 0.015),
                    _buildInfoRow(Icons.room, 'Sala $classroom', Colors.white70,
                        screenWidth),
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


