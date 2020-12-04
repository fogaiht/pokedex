import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<LoginRepository>())),
        Bind((i) => LoginRepository(Modular.get<CustomDio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/login', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
