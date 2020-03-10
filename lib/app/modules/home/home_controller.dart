import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

@observable
bool screenPage = true;

@action
nextPage(){
  screenPage = !screenPage;
}
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
