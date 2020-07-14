import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_module.dart';
import '../custom_dio/custom_dio.dart';
import 'auth_controller.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    AuthController auth = Modular.get();
    CustomDio dio = Modular.get();

    print("REQUEST: [${options.method}] -> PATH: ${options.path} Auth");
    var token = auth.token;
    print(token);

    if (token == null && options.path != "/create") {
      dio.lock();
      print("token null");
      token = await dio.login();
      options.headers.addAll({"auth": token});
      dio.unlock();
      return options;
    } else {
      print("token not null");
      options.headers.addAll({"auth": token});
      return options;
    }
  }

  @override
  Future onError(DioError e) async {
    print(
        "RESPONSE: [${e.response?.statusCode}] -> PATH: ${e.request.path} Auth");

    if (e.response?.statusCode == 402) {
      CustomDio dio = Inject<AppModule>.of().get();
      AuthController auth = Inject<AppModule>.of().get();

      RequestOptions options = e.response.request;

      if (auth.token != options.headers["auth"]) {
        options.headers["auth"] = auth.token;
        return dio.request(options.path, options: options);
      }

      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      return auth.login().then((d) {
        //update csrfToken
        options.headers["auth"] = d;
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((e) {
        //repeat
        return dio.request(options.path, options: options);
      });
    }

    return e;
  }

  @override
  Future onResponse(Response response) async {
    print(
        "RESPONSE: [${response.statusCode}] -> PATH: ${response.request.path} Auth");

    return response;
  }
}
