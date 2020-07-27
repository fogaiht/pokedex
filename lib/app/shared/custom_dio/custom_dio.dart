import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../../utils/custom_shared_preferences.dart';
import '../constants.dart';
import '../models/login_model.dart';
import 'custom_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
    interceptors.add(CustomInterceptors());
    options.connectTimeout = 5000;
  }

  CustomSharedPrefs prefs = CustomSharedPrefs();
  String token;
  
  Future<Response> login() async {
    try {
      LoginModel userData = LoginModel.fromJson(await prefs.read("userData"));
      var response = await CustomDio().post("/login", data: userData.toJson());
      print("AQUI A RESPOSTA Ó: ");
      token = response.data["token"];
      print(response.data["token"]);
      return response;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }
}
