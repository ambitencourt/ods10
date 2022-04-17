import 'package:flutter/material.dart';

import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/update_user_document_useacase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/documents_store.dart';
import 'package:ods10/app/modules/journey/presentation/stores/home_store.dart';

class HomeController {
  final HomeStore store;
  final DocumentsStore docsStore;
  final UserStore userStore;
  final GetUserDocumentsUseCase _getUserDocumentsUseCase;
  final UpdateUserDocumentsUseCase _updateUserDocumentsUseCase;
  late TabController tabController;
  HomeController(
    this.store,
    this.docsStore,
    this.userStore,
    this._getUserDocumentsUseCase,
    this._updateUserDocumentsUseCase,
  );

  Future<void> getUserDocuments() async {
    try {
      store.setHasError(false);
      store.setLoading(true);
      List<DocumentEntity> docs = await _getUserDocumentsUseCase(
          '99fed5de-575b-40ec-aee8-01258aa596be');
      docsStore.setDocumentsList(docs);
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
    docsStore.updateDocumentItem(docUpdated);
    store.setLoadingStatus(false);
    return docUpdated;
  }
}
