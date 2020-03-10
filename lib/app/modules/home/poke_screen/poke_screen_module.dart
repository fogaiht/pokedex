import 'package:flutter/src/widgets/framework.dart';
import 'package:poke_api/app/modules/home/poke_screen/poke_screen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/home/poke_screen/poke_screen_page.dart';

class PokeScreenModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeScreenController()),
      ];

  @override
  List<Router> get routers => [
        Router("/pokeScreen", child: (_, args) => PokeScreenPage()),
      ];

  static Inject get to => Inject<PokeScreenModule>.of();

  @override
  Widget get view => PokeScreenPage();
}
