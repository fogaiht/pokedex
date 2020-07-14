import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../shared/auth/auth_repository.dart';
import '../home_controller.dart';

part 'poke_screen_controller.g.dart';

class PokeScreenController = _PokeScreenControllerBase with _$PokeScreenController;

abstract class _PokeScreenControllerBase with Store {
  List<String> cardGenerate = List<String>.generate(20, (i) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${i + 1}.png";
  });

  final AuthRepository _authRepository = Modular.get();
  HomeController homeController = Modular.get<HomeController>();

  @observable
  int currentPage = 0;

  @observable
  int value = 0;

  @observable
  String currentUrl = "";

  @action
  void setPokemon() {
    value = homeController.user.pokemonList.length;
    if (value == 0) {}
  }

  @action
  void increment() {
    if (value < homeController.user.pokemonList.length) {
      print(value);
      value++;
      if (value != 0) {
        currentUrl = homeController.user.pokemonList[value].sprites.frontDefault;
        // _authRepository.fetchPost(user.pokemonList[value].sprites.frontDefault);
      }
      print(value);
    }
  }

  @action
  void decrement() {
    if (value > 0) {
      value--;
      if (value != 0) {
        _authRepository.fetchPost(homeController.user.pokemonList[value].sprites.frontDefault);
      }
      print(value);
    }
  }

  // @action
  // getUser() async {
  //   try {
  //     var response = await _authRepository.getCurrentUser();
  //     if (response != null) {
  //       // print("RESPONSE DATA ${response.data}");
  //       user = UserModel.fromJson(response.data);
  //       // print(user.toString());
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
