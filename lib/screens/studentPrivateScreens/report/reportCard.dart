import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

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
    Color corFaltas = mainColor;

    corFaltas = mainColor;

    Color? corNota = mainColor;

    Color corSituacao = mainColor;
    IconData iconeSituacao = Icons.pending;
    if (situation == 'Aprovado') {
      iconeSituacao = Icons.verified;
    } else if (situation == 'Reprovado') {
      iconeSituacao = Icons.warning;
    }

    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: screenWidth * 0.04),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  
                  height: screenWidth * 0.25,
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    color: corSituacao,
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.07)),
                         
            
        
                  ),
                  
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          iconeSituacao,
                          color: backgroundColor,
                          size: screenWidth * 0.15,
                        ),
                        SizedBox(height: screenWidth * 0.02),
                        Text(
                          situation.toString(),
                          style: TextStyle(
                            color: backgroundColor,
                            fontSize: screenWidth * 0.035,
                          ),
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
                            size: screenWidth * 0.06,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Flexible(
                            child: Text(
                              discipline,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        children: [
                          Icon(
                            Icons.emoji_events,
                            color: messageTextColor,
                            size: screenWidth * 0.06,
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Flexible(
                            child: Text(
                              "Nota: " + grade.toString(),
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          grade <= 6.5
                              ? Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.01),
                                    Icon(Icons.warning, color: corNota),
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        children: [
                          Icon(
                            Icons.event_busy,
                            color: messageTextColor,
                            size: screenWidth * 0.06,
                          ),
                          Flexible(
                            child: Text(
                              "Faltas: " +
                                  absences.toString() +
                                  " (máximo " +
                                  maxAbsences.toString() +
                                  ")",
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          absences >= (maxAbsences / 2)
                              ? Row(
                                  children: [
                                    SizedBox(width: screenWidth * 0.01),
                                    Icon(
                                      Icons.warning,
                                      color: corFaltas,
                                    )
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
