import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../utils/sub_states.dart';
import 'sign_up_repository.dart';
import 'sign_up_store.dart';
import 'sign_up_validator.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final SignUpRepository _repository;
  final SignUpStore store;

  final SignUpValidator validators;

  _SignUpControllerBase(this._repository, this.store, this.validators);

  createUser() async {
    try {
      store.subState = SubState.loading;
      var response = await _repository.createUser(
        name: store.name,
        email: store.email,
        password: store.password,
      );
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        store.subState = SubState.success;
        await Future.delayed(Duration(milliseconds: 2000));
        Modular.to.pushReplacementNamed("/login");
      }
    } catch (e) {
      print(e);
      store.subState = SubState.error;
    }
  }
}
