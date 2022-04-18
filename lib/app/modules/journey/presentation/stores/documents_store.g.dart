// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DocumentsStore on _DocumentsStoreBase, Store {
  final _$percentDoneAtom = Atom(name: '_DocumentsStoreBase.percentDone');

  @override
  double get percentDone {
    _$percentDoneAtom.reportRead();
    return super.percentDone;
  }

  @override
  set percentDone(double value) {
    _$percentDoneAtom.reportWrite(value, super.percentDone, () {
      super.percentDone = value;
    });
  }

  final _$_DocumentsStoreBaseActionController =
      ActionController(name: '_DocumentsStoreBase');

  @override
  void setDocumentsList(List<DocumentEntity> list) {
    final _$actionInfo = _$_DocumentsStoreBaseActionController.startAction(
        name: '_DocumentsStoreBase.setDocumentsList');
    try {
      return super.setDocumentsList(list);
    } finally {
      _$_DocumentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDocumentItem(DocumentEntity doc) {
    final _$actionInfo = _$_DocumentsStoreBaseActionController.startAction(
        name: '_DocumentsStoreBase.updateDocumentItem');
    try {
      return super.updateDocumentItem(doc);
    } finally {
      _$_DocumentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updatePercentDone() {
    final _$actionInfo = _$_DocumentsStoreBaseActionController.startAction(
        name: '_DocumentsStoreBase.updatePercentDone');
    try {
      return super.updatePercentDone();
    } finally {
      _$_DocumentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
percentDone: ${percentDone}
    ''';
  }
}
