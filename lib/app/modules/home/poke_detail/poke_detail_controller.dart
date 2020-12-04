import 'package:mobx/mobx.dart';

import '../../../shared/models/pokemon_model.dart';

part 'poke_detail_controller.g.dart';

class PokeDetailController = _PokeDetailControllerBase
    with _$PokeDetailController;

abstract class _PokeDetailControllerBase with Store {

@observable
PokemonModel pokeModel;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
