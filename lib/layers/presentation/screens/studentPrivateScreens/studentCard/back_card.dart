import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/aluno_entity_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/cardPainter.dart';
import 'package:provider/provider.dart';

class BackCard extends StatelessWidget {
  const BackCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Container(
        width: screenWidth * 0.95,
        constraints: BoxConstraints(minHeight: screenHeight * 0.45),
        height: screenHeight * 0.5,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.shade900,
              Colors.green.shade500,
              Colors.teal.shade900,
            ],
            stops: const [0.1, 0.5, 0.9],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.lightGreenAccent.withValues(alpha: 0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: const Offset(5, 7),
            ),
          ],
          border: Border.all(
            color: const Color.fromARGB(255, 14, 13, 13).withValues(alpha: 0.3),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            // Efeito de partículas brilhantes
            Positioned.fill(
              child: Opacity(
                opacity: 1,
                child: CustomPaint(
                  painter: CardPainter(),
                ),
              ),
            ),

            Consumer<AlunoControlerProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            _InfoTile(
                              label: "Situação",
                              value:
                                  provider.alunoController.aluno!.getSituacao!,
                              screenWidth: screenWidth,
                            ),
                            _InfoTile(
                              label: "Turno",
                              value: provider.alunoController.aluno!.getTurno!,
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Row(
                          children: [
                            _InfoTile(
                              label: "Data de Inicio",
                              value: provider
                                      .alunoController.aluno!.getDataInicio!.day
                                      .toString() +
                                  "/" +
                                  provider.alunoController.aluno!.getDataInicio!
                                      .month
                                      .toString() +
                                  "/" +
                                  provider.alunoController.aluno!.getDataInicio!
                                      .year
                                      .toString(),
                              screenWidth: screenWidth,
                            ),
                            _InfoTile(
                              label: "Data de fim",
                              value:
                                  provider.alunoController.aluno!.getDataFim ==
                                          null
                                      ? "..."
                                      : provider.alunoController.aluno!
                                              .getDataFim!.day
                                              .toString() +
                                          "/" +
                                          provider.alunoController.aluno!
                                              .getDataFim!.month
                                              .toString() +
                                          "/" +
                                          provider.alunoController.aluno!
                                              .getDataFim!.year
                                              .toString(),
                              screenWidth: screenWidth,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 8,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: null ??
                                Icon(
                                  Icons.qr_code,
                                  size: screenWidth * 0.2,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          provider.alunoController.aluno!.getMatricula,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.03,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withValues(alpha: 0.3),
                                blurRadius: 5,
                                offset: const Offset(2, 2),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final double screenWidth;

  const _InfoTile({
    Key? key,
    required this.label,
    required this.value,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.02,
          horizontal: screenWidth * 0.015,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.035,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: screenWidth * 0.005),
            Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

