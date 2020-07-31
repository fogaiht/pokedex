import 'package:mobx/mobx.dart';

import '../../utils/sub_states.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
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
}