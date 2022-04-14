import 'package:flutter/material.dart';

import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase.dart';

class HomeController {
  final GetUserDocumentsUseCase _getUserDocumentsUseCase;
  late TabController tabController;
  HomeController(
    this._getUserDocumentsUseCase,
  );

  Future<void> getUserDocuments() async {
    _getUserDocumentsUseCase('sfdsfds');
  }
}
