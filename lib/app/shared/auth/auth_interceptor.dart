import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:poke_api/app/shared/custom_dio/custom_dio.dart';
import '../../app_module.dart';
import 'auth_controller.dart';

class AuthInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    AuthController auth = Modular.get();
    CustomDio dio = Modular.get();

    print("REQUEST: [${options.method}] -> PATH: ${options.path} Auth");
    var token = auth.token;
    print(token);

    if (token == null && options.path != "/login") {
      dio.lock();
      print("token null");
      token = await auth.login();
      options.headers.addAll({"x-token": token});
      dio.unlock();
      return options;
    } else {
      print("token not null");
      options.headers.addAll({"x-token": token});
      return options;
    }
  }

  @override
  Future onError(DioError e) async {
//    print("RESPONSE: [${e.response.statusCode}] -> PATH: ${e.request.path} Auth");

    if (e.response?.statusCode == 402) {
      CustomDio dio = Inject<AppModule>.of().get();
      AuthController auth = Inject<AppModule>.of().get();

      RequestOptions options = e.response.request;

      if (auth.token != options.headers["x-token"]) {
        options.headers["x-token"] = auth.token;
        return dio.request(options.path, options: options);
      }

      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      return auth.login().then((d) {
        //update csrfToken
        options.headers["x-token"] = d;
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
    print("RESPONSE: [${response.statusCode}] -> PATH: ${response.request.path} Auth");

    return response;
  }
}
