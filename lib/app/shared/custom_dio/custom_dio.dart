import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:poke_api/app/shared/models/login_model.dart';
import 'package:poke_api/app/utils/custom_shared_preferences.dart';

import '../constants.dart';
import 'custom_interceptor.dart';

class CustomDio extends DioForNative {
  CustomDio() {
    options.baseUrl = BASE_URL;
    interceptors.add(CustomInterceptors());
//   interceptors.add(AuthInterceptors());
    options.connectTimeout = 5000;
  }

  CustomSharedPrefs prefs = CustomSharedPrefs();
  String token;

  Future<String> login() async {
    try {
      LoginModel userData = LoginModel.fromJson(await prefs.read("userData"));
      var response = await CustomDio().post("/login", data: userData.toJson());
      print("AQUI A RESPOSTA Ó: ");
      token = response.data["token"];
      print(response.data["token"]);
      return response.data["token"];
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
