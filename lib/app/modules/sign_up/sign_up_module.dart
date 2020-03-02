import 'package:poke_api/app/modules/sign_up/sign_up_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/sign_up/sign_up_page.dart';

class SignUpModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SignUpController()),
      ];

  @override
  List<Router> get routers => [
        Router('/signup', child: (_, args) => SignUpPage()),
      ];

  static Inject get to => Inject<SignUpModule>.of();
}
