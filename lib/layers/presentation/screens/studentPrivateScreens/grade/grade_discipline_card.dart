import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/domain/entities/models/gradeDiary_entity.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/buttomPainter.dart';
import 'gradeDiary/grade_diary._screen.dart';

class GradeDisciplineCard extends StatelessWidget {
  final GradeDiaryEntity? _discipline_data;
  const GradeDisciplineCard(
    this._discipline_data, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final List<Color> gradientColors = [
      Colors.teal.shade900,
      Colors.green.shade700,
      Colors.teal.shade900,
    ];

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GradeDiaryScreen(_discipline_data)),
      ),
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
                painter: ButtomPainter(),
              ),
            ),
            // Conteúdo principal do cartão
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.15,
                  height: screenWidth * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.school,
                      color: Colors.white,
                      size: screenWidth * 0.09,
                    ),
                  ),
                ),
                SizedBox(width: screenWidth * 0.05),
                // Texto com o nome da disciplina
                Expanded(
                  child: Text(
                    _discipline_data!.nomeDisciplina!.substring(
                        _discipline_data.nomeDisciplina!.indexOf(' - ') + 2),
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Ícone de seta para frente
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: screenWidth * 0.043,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

