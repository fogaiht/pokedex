import 'package:poke_api/app/modules/login/login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/login/login_page.dart';
import 'package:poke_api/app/modules/login/login_repository.dart';
import 'package:poke_api/app/shared/custom_dio/custom_dio.dart';

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
