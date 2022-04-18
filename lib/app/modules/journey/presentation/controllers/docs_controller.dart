import 'package:flutter/material.dart';
import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/update_user_document_useacase.dart';

import '../stores/docs_store.dart';

class DocsController {
  final DocsStore store;
  final UserStore userStore;
  final GetUserDocumentsUseCase _getUserDocumentsUseCase;
  final UpdateUserDocumentsUseCase _updateUserDocumentsUseCase;
  late TabController tabController;
  DocsController(
    this.userStore,
    this.store,
    this._getUserDocumentsUseCase,
    this._updateUserDocumentsUseCase,
  );

  Future<void> getUserDocuments() async {
    try {
      store.setHasError(false);
      store.setLoading(true);
      List<DocumentEntity> docs = await _getUserDocumentsUseCase(
          '99fed5de-575b-40ec-aee8-01258aa596be');
      store.setDocumentsList(docs);
    } catch (e) {
      store.setHasError(true);
      // rethrow;
    } finally {
      store.setLoading(false);
    }
  }

  Future<DocumentEntity> updateUserDocuments(
    String docId,
    DocumentStatusEnum status,
  ) async {
    store.setLoadingStatus(true);
    DocumentEntity docUpdated = await _updateUserDocumentsUseCase(
        '99fed5de-575b-40ec-aee8-01258aa596be', docId, status);
    store.updateDocumentItem(docUpdated);
    store.setLoadingStatus(false);
    return docUpdated;
  }
}
