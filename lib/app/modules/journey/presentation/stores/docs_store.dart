import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
part 'docs_store.g.dart';

class DocsStore = _DocsStoreBase with _$DocsStore;

abstract class _DocsStoreBase with Store {
  @observable
  bool loading = true;

  @action
  void setLoading(bool value) => loading = value;

  @observable
  bool hasError = false;

  @action
  void setHasError(bool value) => hasError = value;

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
