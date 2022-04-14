// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$docsAtom = Atom(name: '_HomeStoreBase.docs');

  @override
  List<DocumentEntity> get docs {
    _$docsAtom.reportRead();
    return super.docs;
  }

  @override
  set docs(List<DocumentEntity> value) {
    _$docsAtom.reportWrite(value, super.docs, () {
      super.docs = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setDocumentsList(List<DocumentEntity> list) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setDocumentsList');
    try {
      return super.setDocumentsList(list);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
docs: ${docs}
    ''';
  }
}
