import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/aluno_entity_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/painters/cardPainter.dart';
import 'package:provider/provider.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({
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
        height: screenHeight * 0.5,
        constraints: BoxConstraints(minHeight: screenHeight * 0.45),
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
            color: const Color.fromARGB(255, 14, 13, 13).withValues(alpha: 0.4),
            width: 2,
          ),
        ),
        child: Stack(
          children: [
            // CustomPaint com o _WavePainter (mais opaco)
            Positioned.fill(
              child: Opacity(
                opacity: 0.5,
                child: CustomPaint(
                  painter: CardPainter(),
                ),
              ),
            ),
            // Logo da instituição com efeito de vidro
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                width: screenWidth * 0.18,
                height: screenWidth * 0.18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.4),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withValues(alpha: 0.4),
                            Colors.white.withValues(alpha: 0.4),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.17,
                        width: MediaQuery.of(context).size.height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo B.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Conteúdo principal
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Container da foto com efeito
                Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        Colors.white.withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: 0.2),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipOval(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.height * 0.17,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Consumer<AlunoControlerProvider>(
                        builder: (context, provider, child) {
                          return Image.network(
                            provider.alunoController.aluno!.getFullImageUrl!,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  )),
                ),

                // Informações do estudante

                Column(
                  children: [
                    Consumer<AlunoControlerProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.alunoController.aluno!.getNome,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.055,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.pinkAccent.withValues(alpha: 0.5),
                                blurRadius: 10,
                                offset: const Offset(2, 2),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    Consumer<AlunoControlerProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.alunoController.aluno!.getCurso!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            color: Colors.white,
                            letterSpacing: 1.1,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenHeight * 0.006),
                    Consumer<AlunoControlerProvider>(
                      builder: (context, provider, child) {
                        return Text(
                          provider.alunoController.aluno!.getModalidade!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.white.withValues(alpha: 0.9),
                            fontStyle: FontStyle.italic,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


