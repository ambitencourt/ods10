import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  bool loading = true;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool loadingStatus = false;

  @action
  void setLoadingStatus(bool value) => loadingStatus = value;

  ObservableList<DocumentEntity> docs = ObservableList<DocumentEntity>();

  @action
  void setDocumentsList(List<DocumentEntity> list) {
    docs = ObservableList<DocumentEntity>.of(list);
  }

  @action
  void updateDocumentItem(DocumentEntity doc) {
    final index = docs.indexWhere((element) => element.id == doc.id);
    docs[index] = doc;
  }
}
