import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:poke_api/app/shared/auth/auth_repository.dart';
import 'package:poke_api/app/shared/custom_dio/custom_dio.dart';
import 'package:poke_api/app/shared/models/login_model.dart';
import 'package:poke_api/app/shared/models/pokemon_model.dart';
import 'package:poke_api/app/utils/custom_shared_preferences.dart';
import 'package:poke_api/app/utils/sub_states.dart';

import '../../app_module.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final CustomDio customDio = CustomDio();

  final String emailRegExpression =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final String passwordRegExpression =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

  final AuthRepository _authRepository = AppModule.to.get();
  final CustomSharedPrefs prefs = CustomSharedPrefs();

  @observable
  var loginModel = LoginModel();

  @action
  setLoginModel(LoginModel model) => loginModel = model;

  @observable
  bool obscureText = true;

  @action
  changeVisibility() => obscureText = !obscureText;

  @observable
  var subState = SubState.start;
/*-------------------------------------------------------------*/
  @observable
  var pokemonURL;

  @action
  setURL(String value) => pokemonURL = value;

  @observable
  List<String> pokeList;

  @action
  setPokeList(List<String> value) => pokeList = value;

  @observable
  List<PokeModel> pokemonList;

  @observable
  var currentUser;

  @action
  setCurrentUser(String value) => currentUser = value;

  @observable
  String email;

  @observable
  String password;

  @action
  setEmail(String value) => email = value.replaceAll(new RegExp(r"\s\b|\b\s"), "");

  @action
  setPassword(String value) => password = value;

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
        return "Digite uma senha válida!";
      } else {
        return null;
      }
    }
  }

  @action
  signIn(function) async {
    LoginModel model = LoginModel(email: email, password: password);

    print(email);
    print(password);
    prefs.save("userData", model);
    prefs.save("userEmail", model.email);

    try {
      subState = SubState.loading;
      var response = await _authRepository.login(model.toJson());
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

  @action
  signInDev(function) async {
    LoginModel test = LoginModel(
      email: "thiago@fernandes.com",
      password: "Thiago@123",
    );

    prefs.save("userData", test);

    print("${test.toJson().toString()} aaaaa");
    try {
      subState = SubState.loading;
      var response = await _authRepository.login(test.toJson());
      print("RESPOSTA NO LOGIN CONTROLLER: $response");
      // setURL(
      //     "${response["user"]["pokemonList"][0]["sprites"]["front_default"]}");
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

  getUsers() async {
    try {
      subState = SubState.loading;
      var response = await _authRepository.getUsers();
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        subState = SubState.success;
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }

  addPokemon(int pokeNumber) async {
    var pokemon = {"pokeNumber": pokeNumber};
    try {
      subState = SubState.loading;
      var response = await _authRepository.addPokemon(pokemon);
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        subState = SubState.success;
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }

  getCurrentUser() async {
    try {
      subState = SubState.loading;
      var response = await _authRepository.getCurrentUser();
      // setURL("${response.data["pokemonList"][0]}");
      setCurrentUser("${response.data.toString()}");
      print("RESPOSTA NO CONTROLLER: ${response.data}");
      if (response != null) {
        subState = SubState.success;
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }

  getPokeList() async {
    try {
      subState = SubState.loading;
      var response = await _authRepository.getCurrentUser();
      if (response != null) {
        subState = SubState.success;

        pokemonList = (response.data["pokemonList"] as List)
            .cast<Map<String, dynamic>>()
            ?.map((item) {
          return PokeModel.fromJson(item);
        })?.toList();

        print(pokemonList[1].name);
      }
    } catch (e) {
      print(e);
      subState = SubState.error;
    }
  }
}
