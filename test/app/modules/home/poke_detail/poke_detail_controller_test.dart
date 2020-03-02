import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/home/poke_detail/poke_detail_controller.dart';
import 'package:poke_api/app/modules/home/poke_detail/poke_detail_module.dart';

void main() {
  initModule(PokeDetailModule());
  PokeDetailController pokedetail;

  setUp(() {
    pokedetail = PokeDetailModule.to.get<PokeDetailController>();
  });

  group('PokeDetailController Test', () {
    test("First Test", () {
      expect(pokedetail, isInstanceOf<PokeDetailController>());
    });

    test("Set Value", () {
      expect(pokedetail.value, equals(0));
      pokedetail.increment();
      expect(pokedetail.value, equals(1));
    });
  });
}
