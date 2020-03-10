import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api/app/shared/auth/auth_repository.dart';
import 'package:poke_api/app/shared/models/pokemon_model.dart';

part 'poke_screen_controller.g.dart';

class PokeScreenController = _PokeScreenControllerBase
    with _$PokeScreenController;

abstract class _PokeScreenControllerBase with Store {
  List<String> cardGenerate = List<String>.generate(20, (i) {
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${i + 1}.png";
  });

  final AuthRepository _authRepository = Modular.get();

PokeModel pokeModel;

@observable
int currentPage = 0;

  @observable
  int value = 0;

  @action
  void increment() {
    if (value < cardGenerate.length) {
      value++;
      if (value != 0) {
        getPokemon();
      }
      print(value);
    }
  }

  @action
  void decrement() {
    if (value > 0) {
      value--;
      if (value != 0) {
        getPokemon();
      }
      print(value);
    }
  }
  @action
  getPokemon() async {
    try {
      var response = await _authRepository.getPokeInfo(value);
      if (response != null) {
        // print(response.data);
        // myStatementList = (response.data["object"] as List)
        //     .cast<Map<String, dynamic>>()
        //     ?.map((item) {
        //   return StatementModel.fromJson(item);
        // })?.toList();
        pokeModel = PokeModel.fromJson(response.data);
        print("ID: ${pokeModel.id}");
        print("${pokeModel.stats[0].stat.name.toUpperCase()}: ${pokeModel.stats[0].baseStat}");

        // print(myStatementList);
      }
    } catch (e) {
      print(e);
    }
  }
}

