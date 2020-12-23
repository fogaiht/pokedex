import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:poke_api/app/modules/home/home_controller.dart';
import 'package:poke_api/app/modules/home/home_module.dart';
import 'package:poke_api/app/modules/home/home_repository.dart';
import 'package:poke_api/app/shared/auth/auth_interceptor.dart';
import 'package:poke_api/app/shared/auth/http_provider.dart';
import 'package:poke_api/app/shared/custom_dio/custom_dio.dart';
import 'package:poke_api/app/shared/models/user_model.dart';

import '../../payloads/payloads.dart';

class CustomDioMock extends Mock implements CustomDio {}

class DioMock extends Mock implements Dio {}

class HttpProviderMock extends Mock implements HttpProvider {}

class AuthInterceptorMock extends Mock implements AuthInterceptors {}

void main() {
  Dio dio;
  CustomDioMock customDio;
  HttpProvider http;
  HomeRepository repository;
  AuthInterceptors interceptors;

  UserModel user;
  DioError error;

  setUp(() {
    dio = DioMock();
    customDio = CustomDioMock();
    http = HttpProvider(interceptors);
    http.client = dio;
    repository = HomeRepository(http);
    interceptors = AuthInterceptors(customDio);

    user = UserModel.fromJson(currentUserPayload);
    error = DioError(error: "Something Wrong");
  });

  group('HomeRepository Test |', () {
    group('Happy Path -', () {
      test("First Test", () {
        expect(repository, isInstanceOf<HomeRepository>());
      });

      test("Get User Data", () async {
        when(http.client.get(any)).thenAnswer((_) async => Response(data: currentUserPayload, statusCode: 200));

        var result = await repository.getCurrentUser();

        expect(result, user);
      });
      test("Add Pokemon", () async {
        when(http.client.post(any, data: anyNamed("data")))
            .thenAnswer((_) async => Response(data: addPokemonPayload, statusCode: 200));

        var result = await repository.addPokemon("1");

        expect(result, isNotNull);
      });
    });
    group('Not so Happy Path -', () {
      test("Get User Data", () async {
        when(http.client.get(any)).thenThrow(error);
        bool assertionError = false;

        try {
          await repository.getCurrentUser();
        } on DioError {
          assertionError = true;
        }

        expect(assertionError, true);
      });
      test("Add Pokemon", () async {
        when(http.client.post(any, data: anyNamed("data"))).thenThrow(error);

        bool assertionError = false;

        try {
          await repository.addPokemon("1");
        } on DioError {
          assertionError = true;
        }

        expect(assertionError, true);
      });
    });
  });
}
