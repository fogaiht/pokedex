import 'package:mobx/mobx.dart';

part 'sign_up_controller.g.dart';

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
