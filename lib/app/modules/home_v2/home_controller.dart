import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../shared/models/user_model.dart';
import 'home_repository.dart';
import 'home_store.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository _homeRepository;
  final HomeStore store;

  _HomeControllerBase(this._homeRepository, this.store);
  
  final pageController = PageController();
  
  @observable
  ObservableFuture<UserModel> userModelResponse = ObservableFuture.value(null);

  @action
  getUser() async {
    try {
      userModelResponse = _homeRepository.getCurrentUser().asObservable();
      await userModelResponse;
      store.setUser(userModelResponse.value);
      print(store.user);
    } catch (e) {
      print(e);
    }
  }

  @action
  addPokemon(String pokeNumber) async {
    final cancel = BotToast.showLoading();
    try {
      var response = await _homeRepository.addPokemon(pokeNumber);
      await Future.delayed(Duration(milliseconds: 1000)); //um tempo de delay para aparecer o loading
      if (response != null) {
        getUser();
        store.screenIndex = -1;
        cancel();
      }
    } catch (e) {
      cancel();
      print(e);
    }
  }
}
