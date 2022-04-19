// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'islands_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$IslandsStore on _IslandsStoreBase, Store {
  Computed<List<double>>? _$percentDoneComputed;

  @override
  List<double> get percentDone =>
      (_$percentDoneComputed ??= Computed<List<double>>(() => super.percentDone,
              name: '_IslandsStoreBase.percentDone'))
          .value;
  Computed<List<int>>? _$docsReadyComputed;

  @override
  List<int> get docsReady =>
      (_$docsReadyComputed ??= Computed<List<int>>(() => super.docsReady,
              name: '_IslandsStoreBase.docsReady'))
          .value;
  Computed<List<DocumentEntity>>? _$docsComputed;

  @override
  List<DocumentEntity> get docs =>
      (_$docsComputed ??= Computed<List<DocumentEntity>>(() => super.docs,
              name: '_IslandsStoreBase.docs'))
          .value;

  final _$totalPercentDoneAtom =
      Atom(name: '_IslandsStoreBase.totalPercentDone');

  @override
  double get totalPercentDone {
    _$totalPercentDoneAtom.reportRead();
    return super.totalPercentDone;
  }

  @override
  set totalPercentDone(double value) {
    _$totalPercentDoneAtom.reportWrite(value, super.totalPercentDone, () {
      super.totalPercentDone = value;
    });
  }

  final _$totalDocsDoneAtom = Atom(name: '_IslandsStoreBase.totalDocsDone');

  @override
  int get totalDocsDone {
    _$totalDocsDoneAtom.reportRead();
    return super.totalDocsDone;
  }

  @override
  set totalDocsDone(int value) {
    _$totalDocsDoneAtom.reportWrite(value, super.totalDocsDone, () {
      super.totalDocsDone = value;
    });
  }

  final _$_IslandsStoreBaseActionController =
      ActionController(name: '_IslandsStoreBase');

  @override
  void setIslandsList(List<IslandEntity> list) {
    final _$actionInfo = _$_IslandsStoreBaseActionController.startAction(
        name: '_IslandsStoreBase.setIslandsList');
    try {
      return super.setIslandsList(list);
    } finally {
      _$_IslandsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDocumentItem(DocumentEntity doc) {
    final _$actionInfo = _$_IslandsStoreBaseActionController.startAction(
        name: '_IslandsStoreBase.updateDocumentItem');
    try {
      return super.updateDocumentItem(doc);
    } finally {
      _$_IslandsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePercentDone() {
    final _$actionInfo = _$_IslandsStoreBaseActionController.startAction(
        name: '_IslandsStoreBase.updatePercentDone');
    try {
      return super.updatePercentDone();
    } finally {
      _$_IslandsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalPercentDone: ${totalPercentDone},
totalDocsDone: ${totalDocsDone},
percentDone: ${percentDone},
docsReady: ${docsReady},
docs: ${docs}
    ''';
  }
}
