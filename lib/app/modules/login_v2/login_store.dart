import 'dart:convert';

import 'package:mobx/mobx.dart';

import '../../utils/sub_states.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String email;
  @action
  setEmail(String newValue) => email = newValue;

  @observable
  String password;
  @action
  setPassword(String newValue) => password = newValue;
  @computed
  String get password64 => base64.encode(utf8.encode(password));

  @observable
  bool showPassword = false;
  @action
  changeVisibility() => showPassword = !showPassword;

  @observable
  bool rememberMe = true;
  @action
  void changeRemember(bool value) => rememberMe = value;

  @observable
  SubState subState = SubState.start;
  @action
  setSubstate(SubState newValue) => subState = newValue;

  @observable
  String selectedBaseUrl;
  @action
  setBaseUrl(String newBase) => selectedBaseUrl = newBase;

}
