// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$loginModelAtom = Atom(name: '_LoginControllerBase.loginModel');

  @override
  LoginModel get loginModel {
    _$loginModelAtom.context.enforceReadPolicy(_$loginModelAtom);
    _$loginModelAtom.reportObserved();
    return super.loginModel;
  }

  @override
  set loginModel(LoginModel value) {
    _$loginModelAtom.context.conditionallyRunInAction(() {
      super.loginModel = value;
      _$loginModelAtom.reportChanged();
    }, _$loginModelAtom, name: '${_$loginModelAtom.name}_set');
  }

  final _$obscureTextAtom = Atom(name: '_LoginControllerBase.obscureText');

  @override
  bool get obscureText {
    _$obscureTextAtom.context.enforceReadPolicy(_$obscureTextAtom);
    _$obscureTextAtom.reportObserved();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.context.conditionallyRunInAction(() {
      super.obscureText = value;
      _$obscureTextAtom.reportChanged();
    }, _$obscureTextAtom, name: '${_$obscureTextAtom.name}_set');
  }

  final _$subStateAtom = Atom(name: '_LoginControllerBase.subState');

  @override
  SubState get subState {
    _$subStateAtom.context.enforceReadPolicy(_$subStateAtom);
    _$subStateAtom.reportObserved();
    return super.subState;
  }

  @override
  set subState(SubState value) {
    _$subStateAtom.context.conditionallyRunInAction(() {
      super.subState = value;
      _$subStateAtom.reportChanged();
    }, _$subStateAtom, name: '${_$subStateAtom.name}_set');
  }

  final _$pokemonURLAtom = Atom(name: '_LoginControllerBase.pokemonURL');

  @override
  dynamic get pokemonURL {
    _$pokemonURLAtom.context.enforceReadPolicy(_$pokemonURLAtom);
    _$pokemonURLAtom.reportObserved();
    return super.pokemonURL;
  }

  @override
  set pokemonURL(dynamic value) {
    _$pokemonURLAtom.context.conditionallyRunInAction(() {
      super.pokemonURL = value;
      _$pokemonURLAtom.reportChanged();
    }, _$pokemonURLAtom, name: '${_$pokemonURLAtom.name}_set');
  }

  final _$pokeListAtom = Atom(name: '_LoginControllerBase.pokeList');

  @override
  List<String> get pokeList {
    _$pokeListAtom.context.enforceReadPolicy(_$pokeListAtom);
    _$pokeListAtom.reportObserved();
    return super.pokeList;
  }

  @override
  set pokeList(List<String> value) {
    _$pokeListAtom.context.conditionallyRunInAction(() {
      super.pokeList = value;
      _$pokeListAtom.reportChanged();
    }, _$pokeListAtom, name: '${_$pokeListAtom.name}_set');
  }

  final _$pokemonListAtom = Atom(name: '_LoginControllerBase.pokemonList');

  @override
  List<PokeModel> get pokemonList {
    _$pokemonListAtom.context.enforceReadPolicy(_$pokemonListAtom);
    _$pokemonListAtom.reportObserved();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<PokeModel> value) {
    _$pokemonListAtom.context.conditionallyRunInAction(() {
      super.pokemonList = value;
      _$pokemonListAtom.reportChanged();
    }, _$pokemonListAtom, name: '${_$pokemonListAtom.name}_set');
  }

  final _$currentUserAtom = Atom(name: '_LoginControllerBase.currentUser');

  @override
  dynamic get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(dynamic value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$signInAsyncAction = AsyncAction('signIn');

  @override
  Future signIn(dynamic function) {
    return _$signInAsyncAction.run(() => super.signIn(function));
  }

  final _$signInDevAsyncAction = AsyncAction('signInDev');

  @override
  Future signInDev() {
    return _$signInDevAsyncAction.run(() => super.signInDev());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setLoginModel(LoginModel model) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setLoginModel(model);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeVisibility() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.changeVisibility();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setURL(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setURL(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokeList(List<String> value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setPokeList(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setCurrentUser(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setCurrentUser(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPassword(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setType(String value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setType(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'loginModel: ${loginModel.toString()},obscureText: ${obscureText.toString()},subState: ${subState.toString()},pokemonURL: ${pokemonURL.toString()},pokeList: ${pokeList.toString()},pokemonList: ${pokemonList.toString()},currentUser: ${currentUser.toString()}';
    return '{$string}';
  }
}
