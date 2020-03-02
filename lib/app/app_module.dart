import 'package:poke_api/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:poke_api/app/app_widget.dart';
import 'package:poke_api/app/modules/home/home_module.dart';
import 'package:poke_api/app/modules/login/login_module.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_module.dart';
import 'package:poke_api/app/modules/splash_screen/splash_screen_module.dart';

import 'shared/auth/auth_repository.dart';
import 'shared/auth/auth_controller.dart';
import 'shared/custom_dio/custom_dio.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
    Bind((i) => AuthController()),
    Bind((i) => AuthRepository()),
    Bind((i) => CustomDio()),

      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashScreenModule()),
        Router('/', module: HomeModule()),
        Router('/', module: LoginModule()),
        Router('/', module: SignUpModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
