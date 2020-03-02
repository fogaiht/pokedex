import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/shared/custom_dio/custom_interceptor.dart';

import '../constants.dart';
import 'auth_interceptor.dart';

class AuthRepository extends Disposable {
  Dio _client;

  AuthRepository() {
    _client = Dio();
    _client.options.baseUrl = BASE_URL;
    // _client.interceptors.add(AuthInterceptors());
    _client.interceptors.add(CustomInterceptors());
    _client.options.connectTimeout = 15000;
  }

  Future<String> login(Map<String, dynamic> data) async {
    try {
      var response = await _client.post("/login", data: data);
      print("AQUI A RESPOSTA Ó: ");
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<String> addHamburguer(Map<String, dynamic> data) async {
    try {
      var response = await _client.post("/produtos", data: data);
      print("AQUI A RESPOSTA Ó: ");
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<Response> getProdutos() async {
//    await Future.delayed(Duration(milliseconds: 2500));
    try {
      var response = await _client.get("/produtos");
//      var response = await _client.get("/card/listCardsByUser");
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<Response> jobExtract(int month, int year) async {
//    await Future.delayed(Duration(milliseconds: 1500));
    try {
      var response = await _client.get("/job/extract/$month/$year");
//      print(response.headers['token']);

//      this.token = response.headers.map['token'].toString();
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<Response> getDeck() async {
//    await Future.delayed(Duration(milliseconds: 2500));
    try {
      var response = await _client.get("/card/myDeck");
//      var response = await _client.get("/card/listCardsByUser");
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<Response> getUser(String email) async {
//    await Future.delayed(Duration(milliseconds: 2500));
    try {
      var response = await _client.get("/user/?email=$email");
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future fetchPost(Dio client) async {
    final response =
    await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
