import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import 'sign_up_controller.dart';
import 'sign_up_page.dart';
import 'sign_up_repository.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpController(i.get<SignUpRepository>())),
        Bind((i) => SignUpRepository(Modular.get<HttpProvider>())),
      ];

  @override
  List<Router> get routers => [
        Router('/signup', child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
