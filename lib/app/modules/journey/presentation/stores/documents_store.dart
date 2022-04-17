import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
part 'documents_store.g.dart';

class DocumentsStore = _DocumentsStoreBase with _$DocumentsStore;

abstract class _DocumentsStoreBase with Store {
  ObservableList<DocumentEntity> docs = ObservableList<DocumentEntity>();

  @action
  void setDocumentsList(List<DocumentEntity> list) {
    docs = ObservableList<DocumentEntity>.of(list);
    updatePercentDone();
  }

  @action
  void updateDocumentItem(DocumentEntity doc) {
    final index = docs.indexWhere((element) => element.id == doc.id);
    docs[index] = doc;
    updatePercentDone();
  }

  @observable
  double percentDone = 0.0;

  @action
  updatePercentDone() {
    if (docs.isEmpty) return;
    int docsDone = 0;
    for (var item in docs) {
      if (item.status == 'ready') docsDone++;
    }
    percentDone = docsDone / docs.length;
  }
}
