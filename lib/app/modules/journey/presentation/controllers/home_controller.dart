import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_tutorial_completed_usecase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_islands.usecase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/update_user_document_useacase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/home_store.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_store.dart';

class HomeController {
  final HomeStore store;
  final IslandsStore islandsStore;
  final UserStore userStore;
  final UpdateUserDocumentsUseCase _updateUserDocumentsUseCase;
  final GetUserIslandsUseCase _getUserIslandsUseCase;
  final GetTutorialCompletedUseCase _getTutorialCompletedUseCase;
  late TabController tabController;
  HomeController(
    this.store,
    this.islandsStore,
    this.userStore,
    this._updateUserDocumentsUseCase,
    this._getUserIslandsUseCase,
    this._getTutorialCompletedUseCase,
  );

  Future<void> getUserDocuments() async {
    try {
      store.setHasError(false);
      store.setLoading(true);
      // List<DocumentEntity> docs =
      //     await _getUserDocumentsUseCase(userStore.user!.id);
      // docsStore.setDocumentsList(docs);
      List<IslandEntity> islands =
          await _getUserIslandsUseCase(userStore.user!.id);
      islandsStore.setIslandsList(islands);
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
    DocumentEntity docUpdated =
        await _updateUserDocumentsUseCase(userStore.user!.id, docId, status);
    islandsStore.updateDocumentItem(docUpdated);
    // docsStore.updateDocumentItem(docUpdated);
    store.setLoadingStatus(false);
    return docUpdated;
  }

  Future<void> navigateToIslands() async {
    print(await _getTutorialCompletedUseCase());
    if (await _getTutorialCompletedUseCase()) {
      Modular.to.pushNamed('/journey/islands');
    } else {
      Modular.to.pushNamed('/journey/tutorial');
    }
  }
}
