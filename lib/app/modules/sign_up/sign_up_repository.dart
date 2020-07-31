import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import '../../utils/custom_shared_preferences.dart';

class SignUpRepository extends Disposable {
  final CustomDio _customDio;
  final CustomSharedPrefs prefs = CustomSharedPrefs();

  SignUpRepository(this._customDio);

  Future<Response> createUser({String name, String email, String password}) async {
    try {
      var user = {"name": name, "email": email, "password": password, "pokemonList": []};
      var response = await _customDio.post("/create", data: user);
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
