import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/sign_up/sign_up_module.dart';
import 'modules/splash_screen/splash_screen_module.dart';
import 'shared/auth/auth_interceptor.dart';
import 'shared/auth/http_provider.dart';
import 'shared/custom_dio/custom_dio.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => AuthInterceptors2(i.get<CustomDio>())),
        Bind((i) => HttpProvider(i.get<AuthInterceptors2>())),
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
