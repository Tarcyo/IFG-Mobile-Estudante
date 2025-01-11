import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

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

    if (myGrade == null) {
      return Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: screenWidth * 0.3,
                    width: screenWidth * 0.3,
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(screenWidth * 0.08)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: screenWidth * 0.05,
                            height: screenWidth * 0.05,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.pending,
                                  color: backgroundColor,
                                  size: screenWidth * 0.13,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.01,
                            height: screenWidth * 0.01,
                          ),
                          Column(
                            children: [
                              Text(
                                "Nota:",
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: screenWidth * 0.035,
                                ),
                              ),
                              Text(
                                "Não Lançada",
                                style: TextStyle(
                                  color: backgroundColor,
                                  fontSize: screenWidth * 0.033,
                                ),
                              ),
                            ],
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
                              Icons.science,
                              color: mainColor,
                              size: screenWidth * 0.056,
                            ),
                            Text(
                              " " + activityName,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                            height: screenWidth * 0.015,
                            width: screenWidth * 0.0025),
                        Row(
                          children: [
                            Icon(Icons.book,
                                size: screenWidth * 0.056,
                                color: messageTextColor),
                            Text(
                              " " + activityType,
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 0.015,
                          width: screenWidth * 0.0025,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenWidth * 0.03,
            )
          ],
        ),
      );
    }
    Color indicatorColor = mainColor;
    IconData indicatorIcon = Icons.emoji_events;
    print("My grade:"+myGrade.toString());

    if (double.parse(myGrade!) < (activityMaxGrade * 0.6)) {
      indicatorIcon = Icons.warning;
    }
    return Center(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: screenWidth * 0.03),
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: screenWidth * 0.3,
                  width: screenWidth * 0.3,
                  decoration: BoxDecoration(
                    color: indicatorColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(screenWidth * 0.11)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: screenWidth * 0.05,
                          height: screenWidth * 0.05,
                        ),
                        Center(
                          child: Column(
                            children: [
                              Icon(
                                indicatorIcon,
                                color: backgroundColor,
                                size: screenWidth * 0.13,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                          height: screenWidth * 0.01,
                        ),
                        Column(
                          children: [
                            Text(
                              "Nota:",
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                            Text(
                              "${myGrade.toString()} / ${activityMaxGrade.toString()}",
                              style: TextStyle(
                                color: backgroundColor,
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
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
                            Icons.science,
                            color: mainColor,
                            size: screenWidth * 0.056,
                          ),
                          Text(
                            " " + activityName,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: screenWidth * 0.015,
                          width: screenWidth * 0.0025),
                      Row(
                        children: [
                          Icon(Icons.book,
                              size: screenWidth * 0.056,
                              color: messageTextColor),
                          Text(
                            " " + activityType,
                            style: TextStyle(
                              color: messageTextColor,
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenWidth * 0.015,
                        width: screenWidth * 0.0025,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenWidth * 0.03,
          )
        ],
      ),
    );
  }
}
