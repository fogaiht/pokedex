import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/custom_dio/custom_dio.dart';
import '../../shared/models/login_model.dart';
import '../../shared/models/user_model.dart';
import '../../utils/custom_shared_preferences.dart';

class LoginRepository extends Disposable {
  final CustomDio _customDio;
  final CustomSharedPrefs prefs = CustomSharedPrefs();

  LoginRepository(this._customDio);

  Future<UserModel> signIn(LoginModel model) async {
    print(model.toJson().toString());
    prefs.save("userData", model);

    try {
      var response = await _customDio.login();
      var userResponse = UserModel.fromJson(response.data["user"]);
      return userResponse;
    } on DioError catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  void dispose() {}
}
