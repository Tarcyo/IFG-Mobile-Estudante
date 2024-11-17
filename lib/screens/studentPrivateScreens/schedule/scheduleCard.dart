import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

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

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: screenWidth * 0.045),
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.045),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: screenWidth * 0.3,
                width: screenWidth * 0.3,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenWidth * 0.055)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05),
                      Center(
                        child: Icon(
                          Icons.schedule,
                          color: backgroundColor,
                          size: screenWidth * 0.15,
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.025,
                          height: screenWidth * 0.025),
                      Text(
                        '$begin - $end',
                        style: TextStyle(
                          color: backgroundColor,
                          fontSize: screenWidth * 0.04,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: mainColor,
                          size: screenWidth * 0.056,
                        ),
                        Flexible(
                          child: Text(
                            ' $discipline',
                            style: TextStyle(
                              color: mainColor,
                              fontSize: screenWidth * 0.036,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenWidth * 0.025,
                        width: screenWidth * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          size: screenWidth * 0.056,
                          color: messageTextColor,
                        ),
                        Flexible(
                          child: Text(
                            ' Prof. $teacher',
                            style: TextStyle(
                              color: messageTextColor,
                              fontSize: screenWidth * 0.036,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height: screenWidth * 0.025,
                        width: screenWidth * 0.005),
                    Row(
                      children: [
                        Icon(
                          Icons.room,
                          size: screenWidth * 0.056,
                          color: messageTextColor,
                        ),
                        Flexible(
                          child: Text(
                            ' Sala $classroom',
                            style: TextStyle(
                              color: messageTextColor,
                              fontSize: screenWidth * 0.036,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
