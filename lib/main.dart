import 'package:provider/provider.dart';
import 'layers/presentation/screens/mainTabBar/mainTabBar.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/autoLoginProvider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/styles/colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/alreadAutoLogged.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/notasControllerProvider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/alunoControllerProvider copy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ifg_mobile_estudante/core/inject/inject.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/aluno_controller.dart';
import 'package:ifg_mobile_estudante/layers/presentation/controllers/notas_controler.dart';

import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.init();

  TextEditingController senhaController = TextEditingController();
  FlutterSecureStorage storage = FlutterSecureStorage();

  String matricula = "";
  bool autoLogin = (await storage.read(key: 'autoLogin')) == 'true';

  AlunoController alunoController = GetIt.instance.get<AlunoController>();
  NotasController notasController = GetIt.instance.get<NotasController>();

  if (autoLogin) {
    matricula = await storage.read(key: 'matricula') ?? "";
    senhaController.text = await storage.read(key: 'senha') ?? "";

    await alunoController.getAlunoPorMatricula(matricula);
  }

   

  runApp(IFG_Mobile_Estudante(autoLogin, alunoController, notasController));
}

class IFG_Mobile_Estudante extends StatelessWidget {
  final bool _autoLogin;
  final AlunoController _alunoController;
  final NotasController _notasController;
  const IFG_Mobile_Estudante(
    this._autoLogin,
    this._alunoController,
    this._notasController, {
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => AutoLoginProvider(
                  _autoLogin,
                )),
        ChangeNotifierProvider(create: (_) => AlreadAutoLogged()),
        ChangeNotifierProvider(
            create: (_) => AlunoControlerProvider(_alunoController)),
        ChangeNotifierProvider(
            create: (_) => NotasControlerProvider(_notasController)),
      ],
      child: Builder(
        builder: (context) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: mainColor,
          ));

          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
          setDarkMode(
              MediaQuery.of(context).platformBrightness == Brightness.dark);

          return MaterialApp(
            title: 'IFG Mobile Estudante',
            theme: ThemeData(
              primaryColor: mainColor,
              appBarTheme: AppBarTheme(
                color: backgroundColor,
                iconTheme: IconThemeData(color: backgroundColor),
              ),
              fontFamily: "Quicksand",
            ),
            debugShowCheckedModeBanner: false,
            home: MainTabBar(),
          );
        },
      ),
    );
  }
}
