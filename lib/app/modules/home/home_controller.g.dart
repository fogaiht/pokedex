// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$valueAtom = Atom(name: '_HomeControllerBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
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
  void increment() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'screenPage: ${screenPage.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
