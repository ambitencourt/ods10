// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islands_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IslandsPageStore on _IslandsPageStoreBase, Store {
  final _$currentAtom = Atom(name: '_IslandsPageStoreBase.current');

  @override
  int get current {
    _$currentAtom.reportRead();
    return super.current;
  }

  @override
  set current(int value) {
    _$currentAtom.reportWrite(value, super.current, () {
      super.current = value;
    });
  }

  final _$progressValueAtom = Atom(name: '_IslandsPageStoreBase.progressValue');

  @override
  double get progressValue {
    _$progressValueAtom.reportRead();
    return super.progressValue;
  }

  @override
  set progressValue(double value) {
    _$progressValueAtom.reportWrite(value, super.progressValue, () {
      super.progressValue = value;
    });
  }

  final _$_IslandsPageStoreBaseActionController =
      ActionController(name: '_IslandsPageStoreBase');

  @override
  dynamic setCurrentIndex(int value) {
    final _$actionInfo = _$_IslandsPageStoreBaseActionController.startAction(
        name: '_IslandsPageStoreBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_IslandsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProgressValue(double value) {
    final _$actionInfo = _$_IslandsPageStoreBaseActionController.startAction(
        name: '_IslandsPageStoreBase.setProgressValue');
    try {
      return super.setProgressValue(value);
    } finally {
      _$_IslandsPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
current: ${current},
progressValue: ${progressValue}
    ''';
  }
}
