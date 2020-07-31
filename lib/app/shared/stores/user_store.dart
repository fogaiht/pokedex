import 'package:mobx/mobx.dart';

import '../models/login_model.dart';

part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  LoginModel _loginData;
  @action
  setLoginData(LoginModel newValue) => _loginData = newValue;
  @computed
  LoginModel get loginData => _loginData;

  @observable
  bool _rememberMe;
  @action
  setRememberMe(bool newValue) => _rememberMe = newValue;
  @computed
  bool get rememberMe => _rememberMe;
}
