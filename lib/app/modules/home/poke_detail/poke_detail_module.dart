import 'package:poke_api/app/modules/home/poke_detail/poke_detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/modules/home/poke_detail/poke_detail_page.dart';

class PokeDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokeDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => PokeDetailPage()),
      ];

  static Inject get to => Inject<PokeDetailModule>.of();
}
