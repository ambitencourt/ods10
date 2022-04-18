// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'docs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DocsStore on _DocsStoreBase, Store {
  final _$loadingAtom = Atom(name: '_DocsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_DocsStoreBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$loadingStatusAtom = Atom(name: '_DocsStoreBase.loadingStatus');

  @override
  bool get loadingStatus {
    _$loadingStatusAtom.reportRead();
    return super.loadingStatus;
  }

  @override
  set loadingStatus(bool value) {
    _$loadingStatusAtom.reportWrite(value, super.loadingStatus, () {
      super.loadingStatus = value;
    });
  }

  final _$_DocsStoreBaseActionController =
      ActionController(name: '_DocsStoreBase');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_DocsStoreBaseActionController.startAction(
        name: '_DocsStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_DocsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError(bool value) {
    final _$actionInfo = _$_DocsStoreBaseActionController.startAction(
        name: '_DocsStoreBase.setHasError');
    try {
      return super.setHasError(value);
    } finally {
      _$_DocsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingStatus(bool value) {
    final _$actionInfo = _$_DocsStoreBaseActionController.startAction(
        name: '_DocsStoreBase.setLoadingStatus');
    try {
      return super.setLoadingStatus(value);
    } finally {
      _$_DocsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDocumentsList(List<DocumentEntity> list) {
    final _$actionInfo = _$_DocsStoreBaseActionController.startAction(
        name: '_DocsStoreBase.setDocumentsList');
    try {
      return super.setDocumentsList(list);
    } finally {
      _$_DocsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDocumentItem(DocumentEntity doc) {
    final _$actionInfo = _$_DocsStoreBaseActionController.startAction(
        name: '_DocsStoreBase.updateDocumentItem');
    try {
      return super.updateDocumentItem(doc);
    } finally {
      _$_DocsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
hasError: ${hasError},
loadingStatus: ${loadingStatus}
    ''';
  }
}