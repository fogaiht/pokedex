import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/auth/http_provider.dart';
import '../../shared/models/user_model.dart';

class HomeRepository extends Disposable {
  final HttpProvider _httpProvider;

  HomeRepository(this._httpProvider);

  Future<UserModel> getCurrentUser() async {
    try {
      var response = await _httpProvider.client.get("/findUserById");
      final _finalResponse = UserModel.fromJson(response.data);
      return _finalResponse;
    } on DioError catch (e) {
      print(e);
      throw (e);
    }
  }

  Future<dynamic> addPokemon(String pokeNumber) async {
    try {
      var response = await _httpProvider.client.post("/addPokemon", data: {"pokeNumber": pokeNumber});
      // print("RESPOSTA ADD POKEMON: ${response.data}");
      return response.data;
    } on DioError catch (e) {
      print(e);
      throw (e);
    }
  }

  @override
  void dispose() {}
}
