import 'package:ifg_mobile_estudante/layers/presentation/providers/alunoControllerProvider%20copy.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/horizontalBorderlessButtom.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/horizontalButtom.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/publicScreens/questions/questionList.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/publicScreens/regulations/rightList.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' show json;
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/headerBuilder.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/veryLongHorizontalButtom.dart';
import 'package:ifg_mobile_estudante/layers/presentation/screens/studentPrivateScreens/studentScreen.dart';
import 'package:ifg_mobile_estudante/layers/presentation/reusableWidgets/roundedButtom.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:io';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/alreadAutoLogged.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/autoLoginProvider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    //
    final AlreadAutoLogged alreadAutoLoggedProvider =
        Provider.of<AlreadAutoLogged>(context);
    final AutoLoginProvider autoLoginProvider =
        Provider.of<AutoLoginProvider>(context);

    if (autoLoginProvider.autoLogin &&
        !alreadAutoLoggedProvider.alreadAutoLogged) {
      final AlunoControlerProvider controlerProvider =
          Provider.of<AlunoControlerProvider>(
        context,
      );
      alreadAutoLoggedProvider.setAlreadAutoLogged(true);
      Future.microtask(() {
        if (controlerProvider.alunoController.aluno == null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: backgroundColor,
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
                        color: mainColor,
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
                        color: messageTextColor,
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
                          backgroundColor: mainColor,
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
                            color: backgroundColor,
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
        backgroundColor: backgroundColor,
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
  return HeaderBuilder(
    left: IconButton(
      icon: Icon(
        Icons.logout,
        color: backgroundColor,
        size: screenWidth * 0.08,
      ),
      onPressed: () => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: backgroundColor,
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
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Deseja realmente sair?",
                    style: TextStyle(
                      color: messageTextColor,
                      fontSize: screenWidth * 0.032,
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
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
                          color: backgroundColor,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: mainColor,
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
                          color: backgroundColor,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )
      },
    ),
    right: IconButton(
      icon: Icon(
        Icons.help_outline,
        color: backgroundColor,
        size: screenWidth * 0.08,
      ),
      onPressed: () => {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Ajuda",
                    style: TextStyle(
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Para acessar informações importantes sobre seus direitos e deveres, "
                    "clique nos botões 'Direitos dos Alunos' ou 'Dúvidas Frequentes'."
                    "\n\nAcessar páginas importantes do instituto clique nos botões no centro da tela"
                    "\n\nPara visualizar suas notas, faltas, materiais, clique no botão 'Painel do Estudante'.",
                    style: TextStyle(
                      color: messageTextColor,
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
                        backgroundColor: mainColor,
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
                          color: backgroundColor,
                          fontSize: screenWidth * 0.032,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )
      },
    ),
    center: MediaQuery.of(context).platformBrightness == Brightness.dark
        ? Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo B-dark.png'),
                fit: BoxFit.contain,
              ),
            ),
          )
        : Container(
            height: screenHeight * 0.15,
            width: screenHeight * 0.15,
            decoration: BoxDecoration(
              color: backgroundColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo B.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
    top: Text(
      "IFG Mobile Estudante",
      style: TextStyle(fontSize: screenWidth * 0.05, color: backgroundColor),
    ),
    bottom: const SizedBox(width: 1),
  );
}

Widget _body(BuildContext context, double screenWidth, double screenHeight) {
  return Center(
    child: Container(
      padding: EdgeInsets.only(bottom: screenHeight * 0.01),
      color: backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    children: [
                      SizedBox(width: screenWidth * 0.02),
                      HorizontalBorderlessButtom(
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
                      HorizontalBorderlessButtom(
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
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      HorizontalButtom('Estude\nNo IFG', Icons.login,
                          onPressed: () async {
                        const String url = 'http://www.ifg.edu.br/estudenoifg';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                      HorizontalButtom('Guia de\n cursos', Icons.explore,
                          onPressed: () async {
                        const String url = 'http://cursos.ifg.edu.br';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      HorizontalButtom('Projetos e \nProgramas', Icons.handyman,
                          onPressed: () async {
                        const String url =
                            'https://ifg.edu.br/projetos-e-programas';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        }
                      }),
                      HorizontalButtom(
                          'Assistência \nEstudantil', Icons.handshake,
                          onPressed: () async {
                        const String url =
                            'https://ifg.edu.br/component/content/article/64-ifg/pro-reitorias/extensao/151-assistencia-estudantil';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      HorizontalButtom('Ouvidoria', Icons.campaign,
                          onPressed: () async {
                        const String url = 'https://ifg.edu.br/ouvidoria';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                      HorizontalButtom('Mercado\n De Trabalho', Icons.work,
                          onPressed: () async {
                        const String url = 'https://www.ifg.edu.br/egresso';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          VeryLongHorizontalButtom(
            "Painel do estudante",
            Icons.school,
            onPressed: () async {
              FlutterSecureStorage storage = FlutterSecureStorage();
              TextEditingController matriculaController =
                  TextEditingController();
              TextEditingController senhaController = TextEditingController();
              bool remember = (await storage.read(key: 'lembrar')) == 'true';

              if (remember) {
                matriculaController.text =
                    await storage.read(key: 'matricula') ?? "";
                senhaController.text = await storage.read(key: 'senha') ?? "";
              }

              bool autoLogin = (await storage.read(key: 'autoLogin')) == 'true';

              showModalBottomSheet(
                isDismissible: false,
                backgroundColor: focusBackgroundColor,
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.only(
                          top: 50,
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Icon(
                                Icons.lock,
                                size: screenWidth * 0.2,
                                color: mainColor,
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Requer autenticação',
                                style: TextStyle(
                                  fontSize: screenWidth * 0.06,
                                  color: mainColor,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.01),
                              TextField(
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                  color: messageTextColor,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Matrícula',
                                  labelStyle: TextStyle(
                                    color: mainColor,
                                    fontSize: screenWidth * 0.05,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: mainColor),
                                  ),
                                ),
                                controller: matriculaController,
                              ),
                              SizedBox(height: screenHeight * 0.025),
                              PasswordField(
                                labelText: "Senha",
                                color: mainColor,
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
                                      fontSize: screenWidth * 0.035,
                                      color: mainColor,
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
                                      fontSize: screenWidth * 0.035,
                                      color: mainColor,
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedButtom(
                                    "Entrar",
                                    onPressed: () async {
                                      if (matriculaController.text.isEmpty) {
                                        return;
                                      }

                                      showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Carregando...",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize:
                                                          screenHeight * 0.035),
                                                ),
                                                SizedBox(
                                                  width: screenHeight * 0.06,
                                                  height: screenHeight * 0.06,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: screenHeight *
                                                        0.01, // Espessura da linha
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );

                                      final alunoController =
                                          Provider.of<AlunoControlerProvider>(
                                                  context,
                                                  listen: false)
                                              .alunoController;

                                      await alunoController
                                          .getAlunoPorMatricula(
                                              matriculaController.text);

                                      if (remember) {
                                        await storage.write(
                                            key: 'matricula',
                                            value: matriculaController.text);
                                        await storage.write(
                                            key: 'senha',
                                            value: senhaController.text);
                                        await storage.write(
                                            key: 'lembrar',
                                            value: remember.toString());
                                      } else {
                                        await storage.delete(key: 'matricula');
                                        await storage.delete(key: 'senha');
                                        await storage.delete(key: 'lembrar');
                                      }
                                      if (autoLogin) {
                                        await storage.write(
                                            key: 'autoLogin',
                                            value: autoLogin.toString());
                                        await storage.write(
                                            key: 'matricula',
                                            value: matriculaController.text);
                                        await storage.write(
                                            key: 'senha',
                                            value: senhaController.text);
                                      } else {
                                        await storage.delete(key: 'autoLogin');
                                      }

                                      Navigator.of(context, rootNavigator: true)
                                          .pop();

                                      print("dados" +
                                          alunoController.aluno.toString());

                                      if (alunoController.aluno == null) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              backgroundColor: backgroundColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(32.0),
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Atenção",
                                                    style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.055,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: mainColor,
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
                                                      color: messageTextColor,
                                                      fontSize:
                                                          screenWidth * 0.032,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              actions: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            mainColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      180.0),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text(
                                                        "Ok",
                                                        style: TextStyle(
                                                          color:
                                                              backgroundColor,
                                                          fontSize:
                                                              screenWidth *
                                                                  0.032,
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
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: screenWidth * 0.12,
                            height: screenHeight * 0.12,
                            decoration: BoxDecoration(
                              color: urgentAlertColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.close,
                                color: backgroundColor,
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
      style: TextStyle(color: messageTextColor),
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
    // Obtém a largura e altura da tela
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    // Ajusta o tamanho do checkbox com base no tamanho da tela
    return SizedBox(
      width: screenWidth * 0.09, // Checkbox ocupará 20% da largura da tela
      height: screenHeight * 0.05, // Altura ajustada a 5% da tela
      child: Checkbox(
        hoverColor: mainColor,
        focusColor: mainColor,
        activeColor: mainColor,
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
              return mainColor;
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
    // Obtém a largura e altura da tela
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      width: screenWidth * 0.09,
      height: screenHeight * 0.05,
      child: Checkbox(
        hoverColor: mainColor,
        focusColor: mainColor,
        activeColor: mainColor,
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
              return mainColor;
            }
            return Colors.transparent;
          },
        ),
      ),
    );
  }
}
