import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'home_repository.dart';
import 'poke_detail/poke_detail_module.dart';
import 'poke_screen/poke_screen_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeRepository>())),
        Bind((i) => HomeRepository(Modular.get<HttpProvider>())),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args) => HomePage()),
        Router('/home', module: PokeScreenModule()),
        Router('/home', module: PokeDetailModule()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
