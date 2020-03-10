import 'package:poke_api/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/home/home_page.dart';
import 'package:poke_api/app/modules/home/poke_detail/poke_detail_module.dart';
import 'package:poke_api/app/modules/home/poke_screen/poke_screen_module.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router('/home', child: (_, args) => HomePage()),
        Router('/home', module: PokeScreenModule()),
        Router('/home', module: PokeDetailModule()),
        
      ];

  static Inject get to => Inject<HomeModule>.of();
}
