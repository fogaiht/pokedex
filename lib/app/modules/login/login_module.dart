import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import 'login_controller.dart';
import 'login_page.dart';
import 'login_repository.dart';
import 'login_store.dart';
import 'login_validator.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(
              i.get<LoginRepository>(),
              i.get<LoginValidator>(),
              i.get<LoginStore>(),
            )),
        Bind((i) => LoginRepository(i.get<CustomDio>())),
        Bind((i) => LoginValidator(i.get<LoginStore>())),
        Bind((i) => LoginStore()),
        Bind((i) => CustomDio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
