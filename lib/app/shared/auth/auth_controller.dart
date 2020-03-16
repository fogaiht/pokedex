import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:poke_api/app/shared/models/login_model.dart';
import 'package:poke_api/app/utils/custom_shared_preferences.dart';

import 'auth_repository.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthBase with _$AuthController;

abstract class _AuthBase with Store {
  AuthRepository repo = Modular.get();
  String token;
  CustomSharedPrefs prefs = CustomSharedPrefs();

  Future<String> login() async {
    print("Auth Controller");
    print(await prefs.read("userData"));
    LoginModel userData = LoginModel.fromJson(await prefs.read("userData"));
    print("oi");
    var response = await repo.login(userData.toJson());
    token = response["token"];
    return token;
  }
}
