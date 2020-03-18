import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api/app/shared/auth/auth_repository.dart';
import 'package:poke_api/app/shared/models/user_model.dart';
import 'package:poke_api/app/utils/sub_states.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthRepository _authRepository = Modular.get();

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
        if(screenIndex >= 0)
          currentURL = user.pokemonList[screenIndex]?.sprites?.frontDefault;
      }
    }
  }

  @action
  getUser() async {
    try {
      var response = await _authRepository.getCurrentUser();
      if (response != null) {
        print("AAAAAAAAAAAAAAAAAAAAAAAA ${response.runtimeType}");
        user = UserModel.fromJson(response);
        // print(user.name.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  addPokemon(String pokeNumber) async {
    var pokemon = {"pokeNumber": pokeNumber};
    try {
      subState = SubState.loading;
      var response = await _authRepository.addPokemon(pokemon);
      // print("RESPOSTA NO CONTROLLER: $response");
      if (response != null) {
        subState = SubState.success;
        getUser();
        screenIndex = -1;
        user = UserModel.fromJson(response);
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }
}
