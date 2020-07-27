import 'package:bot_toast/bot_toast.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/user_model.dart';
import '../../utils/sub_states.dart';
import 'home_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  // final AuthRepository _authRepository = Modular.get();

  final HomeRepository _homeRepository;

  _HomeControllerBase(this._homeRepository);

  @observable
  SubState subState;

  @observable
  UserModel user;

  @observable
  bool screenPage = true;

  @action
  nextPage() {
    screenPage = !screenPage;
  }

  @observable
  bool teste = true;

  @observable
  String currentURL;

  @observable
  int screenIndex = -1;

  @action
  void setPokemon() {
    if (screenIndex + 1 != user.pokemonList.length)
      currentURL = user.pokemonList[screenIndex + 1]?.sprites?.frontDefault;
  }

  @action
  void increment() {
    if (screenIndex <= user.pokemonList.length) {
      if (screenIndex + 1 != user.pokemonList.length) {
        currentURL = user.pokemonList[screenIndex + 1]?.sprites?.frontDefault;
        screenIndex++;
      }
    }
  }

  @action
  void decrement() {
    if (screenIndex >= 0 && user.pokemonList.length > 0) {
      screenIndex--;
      if (screenIndex + 1 != user.pokemonList.length) {
        if (screenIndex >= 0) currentURL = user.pokemonList[screenIndex]?.sprites?.frontDefault;
      }
    }
  }

  @action
  getUser() async {
    try {
      var response = await _homeRepository.getCurrentUser();
      if (response != null) {
        user = UserModel.fromJson(response);
        // print(user.name.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  addPokemon(String pokeNumber) async {
    final cancel = BotToast.showLoading();
    try {
      subState = SubState.loading;
      var response = await _homeRepository.addPokemon(pokeNumber);
      await Future.delayed(Duration(milliseconds: 1000)); //um tempo de delay para aparecer o loading
      if (response != null) {
        subState = SubState.success;
        getUser();
        screenIndex = -1;
        user = UserModel.fromJson(response);
        cancel();
      }
    } catch (e) {
      cancel();
      print(e);
      subState = SubState.error;
    }
  }
}
