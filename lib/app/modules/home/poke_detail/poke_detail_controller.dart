import 'package:mobx/mobx.dart';

part 'poke_detail_controller.g.dart';

class PokeDetailController = _PokeDetailControllerBase
    with _$PokeDetailController;

abstract class _PokeDetailControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
