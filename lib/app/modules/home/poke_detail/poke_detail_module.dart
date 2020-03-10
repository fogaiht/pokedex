import 'package:flutter/src/widgets/framework.dart';
import 'package:poke_api/app/modules/home/components/pokedex/pokedex_right/pokedex_right.dart';
import 'package:poke_api/app/modules/home/poke_detail/poke_detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/home/poke_detail/poke_detail_page.dart';

class PokeDetailModule extends ModuleWidget {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router("/pokeDetail", child: (_, args) => PokeDetailPage()),
      ];

  static Inject get to => Inject<PokeDetailModule>.of();

  @override  
  // Widget get view => PokedexRight();
  Widget get view => PokeDetailPage();
}
