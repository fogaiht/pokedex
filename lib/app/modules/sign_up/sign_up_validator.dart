import 'package:mobx/mobx.dart';

import '../../shared/validators/form_error_state.dart';
import 'sign_up_store.dart';

part 'sign_up_validator.g.dart';

class SignUpValidator = _SignUpValidatorBase with _$SignUpValidator;

abstract class _SignUpValidatorBase with Store {
  var formError = FormErrorState();
  final SignUpStore store;

  _SignUpValidatorBase(this.store);
  final String emailRegExpression = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  final List<String> passRegexSteps = [
    r"^(?=.*?[A-Z]).{1,}",
    r"^(?=.*?[a-z]).{1,}",
    r"^(?=.*?[0-9])",
    r"^(?=.*?[!@#\$&*~])"
  ];
  final String passwordRegExpression = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$";

  @action
  void validateEmail(String value) {
    if (!RegExp(emailRegExpression).hasMatch(value)) {
      formError.attributes['email'] = 'Insira um email válido.';
    } else {
      formError.attributes['email'] = null;
      formError.attributes['signinError'] = null;
    }
  }

  @action
  void validatePassword(String value) {
    if (value.isEmpty) {
      formError.attributes['password'] = 'Insira sua senha.';
    } else if (value.length < 6) {
      formError.attributes['password'] = 'A senha deve conter\nno mínimo 6 caracteres.';
    } else if (!RegExp(passwordRegExpression).hasMatch(value)) {
      if (!RegExp(passRegexSteps[0]).hasMatch(value)) {
        formError.attributes['password'] = 'A senha deve conter\numa letra maiúscula.';
      } else if (!RegExp(passRegexSteps[1]).hasMatch(value)) {
        formError.attributes['password'] = 'A senha deve conter\numa letra minúscula.';
      } else if (!RegExp(passRegexSteps[2]).hasMatch(value)) {
        formError.attributes['password'] = 'A senha deve conter\npelo menos um número.';
      } else if (!RegExp(passRegexSteps[3]).hasMatch(value)) {
        formError.attributes['password'] = 'A senha deve conter\npelo menos um caracter especial';
      }
    } else {
      formError.attributes['password'] = null;
      formError.attributes['signinError'] = null;
    }
  }

  List<ReactionDisposer> _disposers;

  void setupValidations() {
    _disposers = [
      reaction((_) => store.email, validateEmail),
      reaction((_) => store.password, validatePassword),
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
