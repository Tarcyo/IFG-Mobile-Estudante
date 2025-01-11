import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
import 'gradeDiary/grade_diary._screen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';

class GradeDisciplineCard extends StatelessWidget {
  final GradeDiaryEntity? _discipline_data;
  const GradeDisciplineCard(
    this._discipline_data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => GradeDiaryScreen(_discipline_data)),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
        height: screenHeight * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.15,
              height: screenWidth * 0.15,
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.circular(screenWidth * 180),
              ),
              child: Center(
                child: Icon(
                  Icons.school,
                  color: backgroundColor,
                  size: screenWidth * 0.09,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.05,
            ),
            Expanded(
              child: Text(
                _discipline_data!.nomeDisciplina!.substring(_discipline_data.nomeDisciplina!.indexOf(' - ')+2),
                   
                style:
                    TextStyle(fontSize: screenWidth * 0.045, color: mainColor),
              ),
            ),
            Icon(
              Icons.arrow_forward,
              color: mainColor,
              size: screenWidth * 0.043,
            ),
          ],
        ),
      ),
    );
  }
}
