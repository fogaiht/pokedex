import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../constants.dart';
import 'auth_interceptor.dart';

class HttpProvider extends Disposable {
  Dio client;

  final AuthInterceptors auth;

  HttpProvider(this.auth) {
    client = Dio();
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(auth);
    client.options.connectTimeout = 10000;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
