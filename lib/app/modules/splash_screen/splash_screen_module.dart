import 'package:poke_api/app/modules/splash_screen/splash_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/splash_screen/splash_screen_page.dart';

class SplashScreenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashScreenController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashScreenPage()),
      ];

  static Inject get to => Inject<SplashScreenModule>.of();
}
