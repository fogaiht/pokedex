// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poke_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeScreenController on _PokeScreenControllerBase, Store {
  final _$currentPageAtom = Atom(name: '_PokeScreenControllerBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.context.enforceReadPolicy(_$currentPageAtom);
    _$currentPageAtom.reportObserved();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.context.conditionallyRunInAction(() {
      super.currentPage = value;
      _$currentPageAtom.reportChanged();
    }, _$currentPageAtom, name: '${_$currentPageAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_PokeScreenControllerBase.value');

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

  final _$getPokemonAsyncAction = AsyncAction('getPokemon');

  @override
  Future getPokemon() {
    return _$getPokemonAsyncAction.run(() => super.getPokemon());
  }

  final _$_PokeScreenControllerBaseActionController =
      ActionController(name: '_PokeScreenControllerBase');

  @override
  void increment() {
    final _$actionInfo =
        _$_PokeScreenControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_PokeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo =
        _$_PokeScreenControllerBaseActionController.startAction();
    try {
      return super.decrement();
    } finally {
      _$_PokeScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'currentPage: ${currentPage.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
