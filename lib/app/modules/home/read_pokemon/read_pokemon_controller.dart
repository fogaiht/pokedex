import 'package:mobx/mobx.dart';

part 'read_pokemon_controller.g.dart';

class ReadPokemonController = _ReadPokemonControllerBase
    with _$ReadPokemonController;

abstract class _ReadPokemonControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
