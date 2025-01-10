import 'package:flutter/material.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/alunoControllerProvider%20copy.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';
import 'package:provider/provider.dart';

class FrontCard extends StatelessWidget {
  const FrontCard({Key? key}) : super(key: key);

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
                width: screenWidth * 0.965,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MediaQuery.of(context).platformBrightness ==
                                    Brightness.dark
                                ? Container(
                                    height: screenWidth * 0.3,
                                    width: screenWidth * 0.4,
                                    decoration: BoxDecoration(
                                      color: focusBackgroundColor,
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/logo B-dark.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: screenWidth * 0.3,
                                    width: screenWidth * 0.4,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/logo B.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                            SizedBox(width: screenWidth * 0.15),
                            Container(
                              height: screenWidth * 0.28,
                              width: screenWidth * 0.28,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Consumer<AlunoControlerProvider>(
                                builder: (context, provider, child) {
                                  return Image.network(
                                    provider.alunoController.aluno!
                                        .getFullImageUrl!,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: mainColor,
                              size: screenWidth * 0.08,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              "Nome",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Consumer<AlunoControlerProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              provider.alunoController.aluno!.getNome,
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              color: mainColor,
                              size: screenWidth * 0.08,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              "Curso",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Consumer<AlunoControlerProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              provider.alunoController.aluno!.getCurso!,
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                              softWrap: false,
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.assignment,
                              color: mainColor,
                              size: screenWidth * 0.08,
                            ),
                            SizedBox(
                              width: screenWidth * 0.01,
                            ),
                            Text(
                              "Modalidade",
                              style: TextStyle(
                                color: mainColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Consumer<AlunoControlerProvider>(
                          builder: (context, provider, child) {
                            return Text(
                              provider.alunoController.aluno!.getModalidade!,
                              style: TextStyle(
                                color: messageTextColor,
                                fontSize: screenWidth * 0.046,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            );
                          },
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
