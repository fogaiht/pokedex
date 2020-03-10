import 'package:mobx/mobx.dart';
import 'package:poke_api/app/shared/models/pokemon_model.dart';

part 'poke_detail_controller.g.dart';

class PokeDetailController = _PokeDetailControllerBase
    with _$PokeDetailController;

abstract class _PokeDetailControllerBase with Store {

@observable
PokeModel pokeModel;

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
