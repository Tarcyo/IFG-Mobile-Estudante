import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'screens/mainTabBar/mainTabBar.dart';
import 'package:ifg_mobile_estudante/providers/userProvider.dart';
import 'package:ifg_mobile_estudante/styles/colors.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'services/apiAluno.dart';
import 'package:ifg_mobile_estudante/providers/alreadAutoLogged.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  TextEditingController senhaController = TextEditingController();
  FlutterSecureStorage storage = FlutterSecureStorage();

  String matricula = "";
  String senha = "";
  bool autoLogin = (await storage.read(key: 'autoLogin')) == 'true';
  dynamic dadosDoAluno = "";

  if (autoLogin) {
    matricula = await storage.read(key: 'matricula') ?? "";
    senhaController.text = await storage.read(key: 'senha') ?? "";
    dadosDoAluno = await solicitaDadosAluno(matricula);
  }
  runApp(IFG_Mobile_Estudante(autoLogin, matricula, senha, dadosDoAluno));
}

class IFG_Mobile_Estudante extends StatelessWidget {
  final bool _autoLogin;
  final String _matricula;
  final String _senha;
  final dynamic _userDada;
  const IFG_Mobile_Estudante(
    this._autoLogin,
    this._matricula,
    this._senha,
    this._userDada, {
    Key? key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainColor,
    ));

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                UserProvider(_autoLogin, _matricula, _senha, _userDada)),
        ChangeNotifierProvider(create: (_) => AlreadAutoLogged()),
      ],
      child: Builder(
        builder: (context) {
          setDarkMode(
              MediaQuery.of(context).platformBrightness == Brightness.dark);

          return MaterialApp(
            title: 'IFG Mobile Estudante',
            theme: ThemeData(
              fontFamily: "Quicksand",
              primaryColor: mainColor,
              appBarTheme: AppBarTheme(
                color: backgroundColor,
                iconTheme: IconThemeData(color: backgroundColor),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: MainTabBar(),
          );
        },
      ),
    );
  }
}
