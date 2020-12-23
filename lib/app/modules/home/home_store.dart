import 'package:mobx/mobx.dart';

import '../../shared/models/pokemon_model.dart';
import '../../shared/models/user_model.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  UserModel _user;
  @action
  setUser(UserModel user) => _user = user;
  @computed
  UserModel get user => _user;

  @observable
  int screenIndex = -1;

  @observable
  String currentURL;

  @observable
  PokemonModel selectedPokemon;

  @action
  selectPokemon(PokemonModel pokemon) => selectedPokemon = pokemon;

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
}
