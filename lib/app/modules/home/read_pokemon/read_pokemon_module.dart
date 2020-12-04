import 'package:flutter_modular/flutter_modular.dart';

import 'read_pokemon_controller.dart';
import 'read_pokemon_page.dart';

class ReadPokemonModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReadPokemonController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ReadPokemonPage()),
      ];

  static Inject get to => Inject<ReadPokemonModule>.of();
}
