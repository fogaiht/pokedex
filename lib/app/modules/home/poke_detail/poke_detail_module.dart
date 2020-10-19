
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'poke_detail_controller.dart';
import 'poke_detail_page.dart';

class PokeDetailModule extends WidgetModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeDetailController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/pokeDetail", child: (_, args) => PokeDetailPage()),
      ];

  static Inject get to => Inject<PokeDetailModule>.of();

  @override
  // Widget get view => PokedexRight();
  Widget get view => PokeDetailPage();
}
