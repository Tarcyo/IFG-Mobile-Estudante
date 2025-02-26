import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/rounded_button_widget.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifg_mobile_estudante/core/utils/url_launcher_helper.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/aluno_entity_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/horizontal_regular_button_widget.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/publicScreens/questions/questionList.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/publicScreens/regulations/right_list.dart';
import 'dart:convert' show json;
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/header_builder_widget.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/very_long_horizontal_button.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/student_screen.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/already_auto_logged_bool_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/will_auto_login_bool_Provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    //
    final AlreadyAutoLogged alreadAutoLoggedProvider =
        Provider.of<AlreadyAutoLogged>(context);
    final AutoLoginProvider autoLoginProvider =
        Provider.of<AutoLoginProvider>(context);

    if (autoLoginProvider.autoLogin &&
        !alreadAutoLoggedProvider.alreadAutoLogged) {
      final AlunoControlerProvider controlerProvider =
          Provider.of<AlunoControlerProvider>(
        context,
      );
      alreadAutoLoggedProvider.setAlreadyAutoLogged(true);
      Future.microtask(() {
        if (controlerProvider.alunoController.aluno == null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Atenção",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Falha ao tentar conectar.\nVerifique seus dados e tente novamente.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.032,
                      ),
                    ),
                  ],
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(180.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.032,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentScreen(),
            ),
          );
        }
      });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green.shade100,
        body: Column(
          children: [
            _header(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: _body(context, screenWidth, screenHeight)),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _header(BuildContext context, double screenWidth, double screenHeight) {
  return HeaderBuilderWidget(
    left: IconButton(
      icon: Icon(
        Icons.logout,
        color: Colors.white,
        size: screenWidth * 0.08,
      ),
      onPressed: () => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade900,
                      Colors.green.shade800,
                      Colors.teal.shade900,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * 0.045),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título centralizado
                    Text(
                      "Atenção",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Mensagem centralizada
                    Text(
                      "Deseja realmente sair?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Botões de ação
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .red.shade600, // Vermelho para ação crítica
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            ),
                          ),
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            "Sim",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .teal.shade400, // Verde/Teal para consistência
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(180.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Não",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.032,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      },
    ),
    right: IconButton(
      icon: Icon(
        Icons.help_outline,
        color: Colors.white,
        size: screenWidth * 0.08,
      ),
      onPressed: () => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              contentPadding: EdgeInsets.zero,
              content: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.teal.shade900,
                      Colors.green.shade800,
                      Colors.teal.shade900,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(32.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(4, 4),
                    ),
                  ],
                ),
                padding: EdgeInsets.all(screenWidth * 0.045),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título centralizado
                    Text(
                      "Ajuda",
                      style: TextStyle(
                        fontSize: screenWidth * 0.055,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Para acessar informações importantes sobre seus direitos e deveres, "
                      "clique nos botões 'Direitos dos Alunos' ou 'Dúvidas Frequentes'."
                      "\n\nAcessar páginas importantes do instituto clique nos botões no centro da tela"
                      "\n\nPara visualizar suas notas, faltas, materiais, clique no botão 'Painel do Estudante'.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.032,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Botão de ação
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(180.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Ok",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.032,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      },
    ),
    center: Container(
      height: screenHeight * 0.15,
      width: screenHeight * 0.15,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/logo B.png'),
          fit: BoxFit.contain,
        ),
      ),
    ),
    top: Text(
      "IFG Mobile Estudante",
      style: TextStyle(fontSize: screenWidth * 0.05, color: Colors.white),
    ),
    bottom: const SizedBox(width: 1),
  );
}

Widget _body(BuildContext context, double screenWidth, double screenHeight) {
  return Center(
    child: Container(
      padding: EdgeInsets.only(bottom: screenHeight * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.03),
                  VeryLongHorizontalButtonWidget(
                    "Painel do estudante",
                    Icons.school,
                    onPressed: () async {
                      FlutterSecureStorage storage = FlutterSecureStorage();
                      TextEditingController matriculaController =
                          TextEditingController();
                      TextEditingController senhaController =
                          TextEditingController();
                      bool remember =
                          (await storage.read(key: 'lembrar')) == 'true';

                      if (remember) {
                        matriculaController.text =
                            await storage.read(key: 'matricula') ?? "";
                        senhaController.text =
                            await storage.read(key: 'senha') ?? "";
                      }

                      bool autoLogin =
                          (await storage.read(key: 'autoLogin')) == 'true';

                      showModalBottomSheet(
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.green.shade100,
                                      Colors.green.shade600,
                                      Colors.green.shade900,
                                    ],
                                    stops: const [0.1, 0.5, 0.9],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(screenWidth * 0.13),
                                    topRight:
                                        Radius.circular(screenWidth * 0.13),
                                  ),
                                  border: const Border(
                                    bottom: BorderSide(
                                      color: Colors.transparent,
                                      width: 5.0,
                                    ),
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: 50,
                                  left: 20,
                                  right: 20,
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom +
                                          20,
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.lock,
                                        size: screenWidth * 0.2,
                                        color: Colors.white,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Requer autenticação',
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.06,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: screenHeight * 0.01),
                                      TextField(
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: InputDecoration(
                                          labelText: 'Matrícula',
                                          labelStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.05,
                                          ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.white),
                                          ),
                                        ),
                                        controller: matriculaController,
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      PasswordField(
                                        labelText: "Senha",
                                        color: Colors.white,
                                        controller: senhaController,
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      Row(
                                        children: [
                                          RememberData(() {
                                            if (remember == true) {
                                              remember = false;
                                            } else {
                                              remember = true;
                                            }
                                            ;
                                          }, remember),
                                          Text(
                                            'Lembrar meus dados',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.025,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: screenHeight * 0.025),
                                      Row(
                                        children: [
                                          AutoLogin(() {
                                            if (autoLogin == true) {
                                              autoLogin = false;
                                            } else {
                                              autoLogin = true;
                                            }
                                            ;
                                          }, autoLogin),
                                          Text(
                                            'Fazer login automaticamente ao entrar',
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.025,
                                              color: Colors.white,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: false,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.025,
                                        height: screenHeight * 0.025,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RoundedButtonWidget(
                                            "Entrar",
                                            onPressed: () async {
                                              if (matriculaController
                                                  .text.isEmpty) {
                                                return;
                                              }

                                              showDialog(
                                                context: context,
                                                barrierDismissible: false,
                                                builder:
                                                    (BuildContext context) {
                                                  return Center(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "Carregando...",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize:
                                                                  screenHeight *
                                                                      0.035),
                                                        ),
                                                        SizedBox(
                                                          width: screenHeight *
                                                              0.06,
                                                          height: screenHeight *
                                                              0.06,
                                                          child:
                                                              CircularProgressIndicator(
                                                            strokeWidth:
                                                                screenHeight *
                                                                    0.01, // Espessura da linha
                                                            valueColor:
                                                                AlwaysStoppedAnimation<
                                                                        Color>(
                                                                    Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );

                                              final alunoController = Provider
                                                      .of<AlunoControlerProvider>(
                                                          context,
                                                          listen: false)
                                                  .alunoController;

                                              await alunoController
                                                  .getAlunoPorMatricula(
                                                      matriculaController.text);

                                              if (remember) {
                                                await storage.write(
                                                    key: 'matricula',
                                                    value: matriculaController
                                                        .text);
                                                await storage.write(
                                                    key: 'senha',
                                                    value:
                                                        senhaController.text);
                                                await storage.write(
                                                    key: 'lembrar',
                                                    value: remember.toString());
                                              } else {
                                                await storage.delete(
                                                    key: 'matricula');
                                                await storage.delete(
                                                    key: 'senha');
                                                await storage.delete(
                                                    key: 'lembrar');
                                              }
                                              if (autoLogin) {
                                                await storage.write(
                                                    key: 'autoLogin',
                                                    value:
                                                        autoLogin.toString());
                                                await storage.write(
                                                    key: 'matricula',
                                                    value: matriculaController
                                                        .text);
                                                await storage.write(
                                                    key: 'senha',
                                                    value:
                                                        senhaController.text);
                                              } else {
                                                await storage.delete(
                                                    key: 'autoLogin');
                                              }

                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop();

                                              print("dados" +
                                                  alunoController.aluno
                                                      .toString());

                                              if (alunoController.aluno ==
                                                  null) {
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      elevation: 0,
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Colors.teal
                                                                  .shade900,
                                                              Colors.green
                                                                  .shade800,
                                                              Colors.teal
                                                                  .shade900,
                                                            ],
                                                            begin: Alignment
                                                                .bottomCenter,
                                                            end: Alignment
                                                                .topCenter,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      32.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black
                                                                  .withValues(
                                                                      alpha:
                                                                          0.3),
                                                              blurRadius: 10,
                                                              offset:
                                                                  const Offset(
                                                                      4, 4),
                                                            ),
                                                          ],
                                                        ),
                                                        padding: EdgeInsets.all(
                                                            screenWidth *
                                                                0.045),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            // Título
                                                            Text(
                                                              "Atenção",
                                                              style: TextStyle(
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.055,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.02),
                                                            // Mensagem de erro
                                                            Text(
                                                              "Falha ao tentar conectar.\nVerifique seus dados e tente novamente.",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize:
                                                                    screenWidth *
                                                                        0.032,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                    screenHeight *
                                                                        0.03),
                                                            // Botão "Ok"
                                                            ElevatedButton(
                                                              style:
                                                                  ElevatedButton
                                                                      .styleFrom(
                                                                backgroundColor:
                                                                    Colors.teal
                                                                        .shade400,
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              180.0),
                                                                ),
                                                              ),
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              child: Text(
                                                                "Ok",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      screenWidth *
                                                                          0.032,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                Navigator.of(context).pop();

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StudentScreen(),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: screenWidth * 0.12,
                                    height: screenHeight * 0.12,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: Colors.white,
                                        size: screenWidth * 0.08,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  SizedBox(height: screenHeight * 0.007),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      HorizontalButtonWidget('Estude\nNo IFG', Icons.login,
                          onPressed: () async {
                        await openWebPage('http://www.ifg.edu.br/estudenoifg');
                      }),
                      HorizontalButtonWidget('Guia de\n cursos', Icons.explore,
                          onPressed: () async {
                        await openWebPage('http://www.ifg.edu.br/estudenoifg');
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      HorizontalButtonWidget(
                          'Projetos e \nProgramas', Icons.handyman,
                          onPressed: () async {
                        await openWebPage(
                            'https://ifg.edu.br/projetos-e-programas');
                      }),
                      HorizontalButtonWidget(
                          'Assistência \nEstudantil', Icons.handshake,
                          onPressed: () async {
                        await openWebPage(
                            'https://ifg.edu.br/component/content/article/64-ifg/pro-reitorias/extensao/151-assistencia-estudantil');
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      HorizontalButtonWidget('Ouvidoria', Icons.campaign,
                          onPressed: () async {
                        await openWebPage('https://ifg.edu.br/ouvidoria');
                      }),
                      HorizontalButtonWidget(
                          'Mercado\n De Trabalho', Icons.work,
                          onPressed: () async {
                        await openWebPage('https://www.ifg.edu.br/egresso');
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.02),
                      HorizontalButtonWidget(
                        'Dúvidas \nFrequentes',
                        Icons.question_mark,
                        onPressed: () async {
                          final String jsonData = await rootBundle
                              .loadString('assets/data/questions.json');

                          final Map<String, dynamic> data =
                              json.decode(jsonData);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuestionsList(data),
                            ),
                          );
                        },
                      ),
                      HorizontalButtonWidget(
                        'Direitos e\nDeveres',
                        Icons.task,
                        onPressed: () async {
                          final String jsonData = await rootBundle
                              .loadString('assets/data/rights_and_duties.json');

                          final Map<String, dynamic> data =
                              json.decode(jsonData);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RightList(data),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class PasswordField extends StatefulWidget {
  final String labelText;
  final Color color;
  final TextEditingController controller;

  PasswordField(
      {required this.labelText, required this.color, required this.controller});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return TextField(
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.white),
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle:
            TextStyle(color: widget.color, fontSize: screenWidth * 0.05),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.color,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: widget.color,
            size: screenWidth * 0.08,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      controller: widget.controller,
    );
  }
}

class RememberData extends StatefulWidget {
  final VoidCallback notify;
  final bool begin;
  RememberData(this.notify, this.begin);

  @override
  _RememberDataState createState() => _RememberDataState(begin);
}

class _RememberDataState extends State<RememberData> {
  bool _remember = false;
  _RememberDataState(this._remember);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      width: screenWidth * 0.09,
      height: screenHeight * 0.05,
      child: Checkbox(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        activeColor: Colors.white,
        value: _remember,
        onChanged: (bool? value) {
          setState(() {
            _remember = value ?? false;
          });
          widget.notify();
        },
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.teal.shade900;
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }
}

class AutoLogin extends StatefulWidget {
  final VoidCallback notify;
  final bool begin;
  AutoLogin(this.notify, this.begin);

  @override
  _AutoLoginState createState() => _AutoLoginState(begin);
}

class _AutoLoginState extends State<AutoLogin> {
  bool _remember = false;
  _AutoLoginState(this._remember);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      width: screenWidth * 0.09,
      height: screenHeight * 0.05,
      child: Checkbox(
        hoverColor: Colors.white,
        focusColor: Colors.white,
        activeColor: Colors.white,
        value: _remember,
        onChanged: (bool? value) {
          setState(() {
            _remember = value ?? false;
          });
          widget.notify();
        },
        fillColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.teal.shade900;
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }
}
