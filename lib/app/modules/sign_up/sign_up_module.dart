import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import 'sign_up_controller.dart';
import 'sign_up_page.dart';
import 'sign_up_repository.dart';
import 'sign_up_store.dart';
import 'sign_up_validator.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpController(
              i.get<SignUpRepository>(),
              i.get<SignUpStore>(),
              i.get<SignUpValidator>(),
            )),
        Bind((i) => SignUpRepository(Modular.get<CustomDio>())),
        Bind((i) => SignUpValidator(i.get<SignUpStore>())),
        Bind((i) => SignUpStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
