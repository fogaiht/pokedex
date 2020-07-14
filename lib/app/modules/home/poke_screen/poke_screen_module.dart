import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'poke_screen_controller.dart';
import 'poke_screen_page.dart';

class PokeScreenModule extends WidgetModule {
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
