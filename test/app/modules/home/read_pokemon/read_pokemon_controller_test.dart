import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:poke_api/app/modules/home/read_pokemon/read_pokemon_controller.dart';
import 'package:poke_api/app/modules/home/read_pokemon/read_pokemon_module.dart';

void main() {
  initModule(ReadPokemonModule());
  ReadPokemonController readpokemon;

  setUp(() {
    readpokemon = ReadPokemonModule.to.get<ReadPokemonController>();
  });

  group('ReadPokemonController Test', () {
    test("First Test", () {
      expect(readpokemon, isInstanceOf<ReadPokemonController>());
    });

    test("Set Value", () {
      expect(readpokemon.value, equals(0));
      readpokemon.increment();
      expect(readpokemon.value, equals(1));
    });
  });
}
