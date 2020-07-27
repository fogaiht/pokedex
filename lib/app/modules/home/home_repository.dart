import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import '../../utils/custom_shared_preferences.dart';

class HomeRepository extends Disposable {
  final HttpProvider _httpProvider;
  final CustomSharedPrefs prefs = CustomSharedPrefs();

  HomeRepository(this._httpProvider);

  Future<dynamic> getCurrentUser() async {
//    await Future.delayed(Duration(milliseconds: 2500));
    try {
      var response = await _httpProvider.client.get("/findUserById");
      return response.data;
    } on DioError catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<dynamic> addPokemon(String pokeNumber) async {
    try {
      var response = await _httpProvider.client.post("/addPokemon", data: {"pokeNumber": pokeNumber});
      print("RESPOSTA ADD POKEMON: ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  void dispose() {}
}
