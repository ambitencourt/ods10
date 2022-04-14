import 'package:flutter/material.dart';

import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/home_store.dart';

class HomeController {
  final GetUserDocumentsUseCase _getUserDocumentsUseCase;
  final HomeStore store;
  late TabController tabController;
  HomeController(
    this._getUserDocumentsUseCase,
    this.store,
  );

  Future<void> getUserDocuments() async {
    List<DocumentEntity> docs = await _getUserDocumentsUseCase('sfdsfds');
    store.setDocumentsList(docs);
  }
}
