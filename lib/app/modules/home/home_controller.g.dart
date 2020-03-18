// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$userAtom = Atom(name: '_HomeControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$screenPageAtom = Atom(name: '_HomeControllerBase.screenPage');

  @override
  bool get screenPage {
    _$screenPageAtom.context.enforceReadPolicy(_$screenPageAtom);
    _$screenPageAtom.reportObserved();
    return super.screenPage;
  }

  @override
  set screenPage(bool value) {
    _$screenPageAtom.context.conditionallyRunInAction(() {
      super.screenPage = value;
      _$screenPageAtom.reportChanged();
    }, _$screenPageAtom, name: '${_$screenPageAtom.name}_set');
  }

  final _$currentURLAtom = Atom(name: '_HomeControllerBase.currentURL');

  @override
  String get currentURL {
    _$currentURLAtom.context.enforceReadPolicy(_$currentURLAtom);
    _$currentURLAtom.reportObserved();
    return super.currentURL;
  }

  @override
  set currentURL(String value) {
    _$currentURLAtom.context.conditionallyRunInAction(() {
      super.currentURL = value;
      _$currentURLAtom.reportChanged();
    }, _$currentURLAtom, name: '${_$currentURLAtom.name}_set');
  }

  final _$screenIndexAtom = Atom(name: '_HomeControllerBase.screenIndex');

  @override
  int get screenIndex {
    _$screenIndexAtom.context.enforceReadPolicy(_$screenIndexAtom);
    _$screenIndexAtom.reportObserved();
    return super.screenIndex;
  }

  @override
  set screenIndex(int value) {
    _$screenIndexAtom.context.conditionallyRunInAction(() {
      super.screenIndex = value;
      _$screenIndexAtom.reportChanged();
    }, _$screenIndexAtom, name: '${_$screenIndexAtom.name}_set');
  }

  final _$getUserAsyncAction = AsyncAction('getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic nextPage() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.nextPage();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPokemon() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.setPokemon();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'user: ${user.toString()},screenPage: ${screenPage.toString()},currentURL: ${currentURL.toString()},screenIndex: ${screenIndex.toString()}';
    return '{$string}';
  }
}
