// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tutorial_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TutoriaPageStore on _TutoriaPageStoreBase, Store {
  Computed<double>? _$percentCompletedComputed;

  @override
  double get percentCompleted => (_$percentCompletedComputed ??=
          Computed<double>(() => super.percentCompleted,
              name: '_TutoriaPageStoreBase.percentCompleted'))
      .value;

  final _$currentAtom = Atom(name: '_TutoriaPageStoreBase.current');

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

  final _$_TutoriaPageStoreBaseActionController =
      ActionController(name: '_TutoriaPageStoreBase');

  @override
  dynamic setCurrentIndex(int value) {
    final _$actionInfo = _$_TutoriaPageStoreBaseActionController.startAction(
        name: '_TutoriaPageStoreBase.setCurrentIndex');
    try {
      return super.setCurrentIndex(value);
    } finally {
      _$_TutoriaPageStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
current: ${current},
percentCompleted: ${percentCompleted}
    ''';
  }
}
