import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/core/utils/get_material_icon_helper.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class MaterialCard extends StatelessWidget {
  final String materialName;
  final String activityType;
  final String uploadDate;
  final String fileExtension;

  MaterialCard({
    required this.materialName,
    required this.activityType,
    required this.uploadDate,
    required this.fileExtension,
    super.key,
  });

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
                height: screenWidth * 0.25,
                width: screenWidth * 0.25,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius:
                      BorderRadius.all(Radius.circular(screenWidth * 180)),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        fileIcon(fileExtension),
                        color: backgroundColor,
                        size: screenWidth * 0.15,
                      ),
                      SizedBox(height: screenWidth * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Abrir",
                            style: TextStyle(
                              color: backgroundColor,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ],
                      )
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
                        Icon(Icons.assignment,
                            color: mainColor, size: screenWidth * 0.056),
                        Text(
                          " " + materialName,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    Row(
                      children: [
                        Icon(Icons.description,
                            size: screenWidth * 0.056, color: messageTextColor),
                        Text(
                          " " + activityType,
                          style: TextStyle(
                            color: messageTextColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.02,
                      width: screenWidth * 0.02,
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month,
                            color: messageTextColor, size: screenWidth * 0.056),
                        Text(
                          " " + uploadDate,
                          style: TextStyle(
                            color: messageTextColor,
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
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
