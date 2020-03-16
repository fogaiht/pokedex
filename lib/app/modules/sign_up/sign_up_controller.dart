import 'package:mobx/mobx.dart';
import 'package:poke_api/app/utils/sub_states.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  final String emailRegExpression =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final String passwordRegExpression =
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$";

  @observable
  String name;
  @action
  setName(String value) => name = value;

  @observable
  String email;
  @action
  setEmail(String value) => email = value;

  @observable
  String password;
  @action
  setPassword(String value) => password = value;

  @observable
  String confirmPassword;
  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @observable
  SubState subState = SubState.start;
  @action
  setSubState(SubState value) {
    print(value);
    subState = value;
    }

  String validateEmail() {
    if (email == null || email == "") {
      return null;
    } else if (!RegExp(emailRegExpression).hasMatch(email)) {
      return "Digite um email válido!";
    }
    return null;
  }

  String validatePassword() {
    if (password == null || password == "") {
      return null;
    } else {
      if (!RegExp(passwordRegExpression).hasMatch(password)) {
        return "Digite uma senha válida!";
      } else {
        return null;
      }
    }
  }
}
