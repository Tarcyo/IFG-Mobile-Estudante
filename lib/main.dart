import 'package:provider/provider.dart';
import 'layers/presentation/screens/mainTabBar/main_tab_bar.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/will_auto_login_bool_Provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/already_auto_logged_bool_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/notas_list_controller_provider.dart';
import 'package:ifg_mobile_estudante/layers/presentation/providers/aluno_entity_controller_provider.dart';
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
  final bool autoLogin = (await storage.read(key: 'autoLogin')) == 'true';

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
        ChangeNotifierProvider(create: (_) => AlreadyAutoLogged()),
        ChangeNotifierProvider(
            create: (_) => AlunoControlerProvider(_alunoController)),
        ChangeNotifierProvider(
            create: (_) => NotasControlerProvider(_notasController)),
      ],
      child: Builder(
        builder: (context) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.teal.shade900,
          ));

          SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

          return MaterialApp(
            title: 'IFG Mobile Estudante',
            theme: ThemeData(
              primaryColor: Colors.green,
              appBarTheme: AppBarTheme(
                color: Colors.green,
                iconTheme: IconThemeData(color: Colors.white),
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
