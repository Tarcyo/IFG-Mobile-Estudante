import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';

class BackCard extends StatelessWidget {
  final Map<String, dynamic> _studentData;

  const BackCard(
    this._studentData, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          SizedBox(
            height: screenWidth * 0.01,
          ),
          SizedBox(
            width: screenWidth * 0.9,
            height: screenWidth * 1,
            child: Card(
              color: focusBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(screenWidth * 0.043),
              ),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.02),
                width: screenWidth * 0.9,
                height: screenWidth * 0.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenWidth * 0.01,
                    ),
                    Text(
                      "Campus -----",
                      style: TextStyle(
                          fontSize: screenWidth * 0.055, color: mainColor),
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.how_to_reg,
                              color: mainColor,
                              size: screenWidth * 0.08,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Matrícula",
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.045,
                                        color: mainColor)),
                                Text(_studentData['matricula'],
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: messageTextColor)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.flag,
                                  color: mainColor,
                                  size: screenWidth * 0.08,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Situação",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            color: mainColor)),
                                    SizedBox(height: screenWidth * 0.01),
                                    Text(_studentData['situacao'],
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: messageTextColor)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenWidth * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.event_busy,
                                  color: mainColor,
                                  size: screenWidth * 0.08,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Validade",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            color: mainColor)),
                                    SizedBox(height: screenWidth * 0.01),
                                    Text("----",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: messageTextColor)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: mainColor,
                                  size: screenWidth * 0.08,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Nascimento",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            color: mainColor)),
                                    SizedBox(height: screenWidth * 0.01),
                                    Text("----",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: messageTextColor)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenWidth * 0.04,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.badge,
                                  color: mainColor,
                                  size: screenWidth * 0.08,
                                ),
                                SizedBox(width: screenWidth * 0.01),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Identidade",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.035,
                                            color: mainColor)),
                                    SizedBox(height: screenWidth * 0.01),
                                    Text("----",
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: messageTextColor)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/qr.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}