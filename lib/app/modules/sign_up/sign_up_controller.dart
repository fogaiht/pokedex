import 'dart:async';

import 'package:mobx/mobx.dart';

import '../../app_module.dart';
import '../../shared/auth/auth_repository.dart';
import '../../utils/sub_states.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final String emailRegExpression =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final String passwordRegExpression =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

  final AuthRepository _authRepository = AppModule.to.get();

  @observable
  String name;
  @action
  setName(String value) => name = value;

  @observable
  String email;
  @action
  setEmail(String value) => email = value.replaceAll(new RegExp(r"\s\b|\b\s"), "");

  @observable
  String password;
  @action
  setPassword(String value) => password = value;

  @observable
  String confirmPassword;
  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @observable
  SubState subState = SubState.start;
  @action
  setSubState(SubState value) {
    print(value);
    subState = value;
  }

  @observable
  bool visibility = true;
  @action
  changeVisibility() => visibility = !visibility;

  // @observable
  // bool visibilityPassword = true;
  // @action
  // changeVisibilityPassword() => visibilityPassword = !visibilityPassword;
  
  // @observable
  // bool visibilityConfirmPassword = true;
  // @action
  // changeVisibilityConfirmPassword() => visibilityConfirmPassword = !visibilityConfirmPassword;




  String validateEmail() {
    if (email == null || email == "") {
      return null;
    } else if (!RegExp(emailRegExpression).hasMatch(email)) {
      return "Digite um email válido!";
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password == "") {
      return null;
    } else {
      if (!RegExp(passwordRegExpression).hasMatch(password)) {
        return "A sua senha deve conter pelo menos: \n- Uma letra maiúscula\n- Uma letra minúscula\n- Caracter especial (ex: @#!..)\n- Números\n- 6 Dígitos";
      } else {
        return null;
      }
    }
  }

  String validateConfirmPassword() {
    if (confirmPassword == password) return null;

    return "Senhas não são iguais, confirme!";
  }

  createUser(function) async {
    var user = {
      "name": name,
      "email": email,
      "password": password,
      "pokemonList": []
    };
    try {
      subState = SubState.loading;
      var response = await _authRepository.createUser(user);
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        subState = SubState.success;
        final Duration pageDelay = Duration(milliseconds: 2000);
        Timer(pageDelay, function);
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }
}
