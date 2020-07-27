import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import '../../utils/custom_shared_preferences.dart';

class SignUpRepository extends Disposable {
  final HttpProvider _httpProvider;
  final CustomSharedPrefs prefs = CustomSharedPrefs();

  SignUpRepository(this._httpProvider);

  Future<Response> createUser({String name, String email, String password}) async {
    

    try {
      var user = {"name": name, "email": email, "password": password, "pokemonList": []};
      var response = await _httpProvider.client.post("/create", data: user);
      print("RESPOSTA ADD POKEMON: ${response.data}");
      return response;
    } on DioError catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  void dispose() {}
}
