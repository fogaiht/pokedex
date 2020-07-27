// import 'package:dio/dio.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import '../constants.dart';
// import 'auth_interceptor.dart';

// class AuthRepository extends Disposable {
//   Dio _client;

//   AuthRepository() {
//     _client = Dio();
//     _client.options.baseUrl = BASE_URL;
//     _client.interceptors.add(AuthInterceptors());
//     // _client.interceptors.add(CustomInterceptors());
//     _client.options.connectTimeout = 15000;
//   }

//   Future<dynamic> login(Map<dynamic, dynamic> data) async {
//     try {
//       var response = await _client.post("/login", data: data);
//       print("AQUI O TOKEN DA RESPOSTA: ${response.data["token"]}");
//       return response.data;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<dynamic> addPokemon(String pokeNumber) async {
//     try {
//       var response = await _client.post("/addPokemon", data: {"pokeNumber": pokeNumber});
//       print("RESPOSTA ADD POKEMON: ${response.data}");
//       return response.data;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<Response> getUsers() async {
// //    await Future.delayed(Duration(milliseconds: 2500));
//     try {
//       var response = await _client.get("/");
//       return response;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<dynamic> getCurrentUser() async {
// //    await Future.delayed(Duration(milliseconds: 2500));
//     try {
//       var response = await _client.get("/findUserById");
//       return response.data;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<Response> createUser(Map<dynamic, dynamic> data) async {
//     try {
//       var response = await _client.post("/create", data: data);
//       print("RESPOSTA ADD POKEMON: ${response.data}");
//       return response;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<Response> getPokeInfo(int pokeId) async {
// //    await Future.delayed(Duration(milliseconds: 2500));
//     try {
//       var response = await _client.get("/$pokeId");
// //      var response = await _client.get("/card/listCardsByUser");
//       return response;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future<Response> getUser(String email) async {
// //    await Future.delayed(Duration(milliseconds: 2500));
//     try {
//       var response = await _client.get("/user/?email=$email");
//       return response;
//     } on DioError catch (e) {
//       throw (e.message);
//     }
//   }

//   Future fetchPost(String url) async {
//     Dio _http = Dio();
//     final response = await _http.get(url);
//     return response.data;
//   }

//   //dispose will be called automatically
//   @override
//   void dispose() {}
// }
