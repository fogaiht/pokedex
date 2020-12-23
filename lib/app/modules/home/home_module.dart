import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import 'home_controller.dart';
import 'home_page.dart';
import 'home_repository.dart';
import 'home_store.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<HomeRepository>(), i.get<HomeStore>())),
        Bind((i) => HomeRepository(Modular.get<HttpProvider>())),
        Bind((i) => HomeStore()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
