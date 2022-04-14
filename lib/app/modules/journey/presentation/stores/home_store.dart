import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  bool loading = true;

  @action
  void setLoading() {
    loading = !loading;
  }

  @observable
  List<DocumentEntity> docs = [];

  @action
  void setDocumentsList(List<DocumentEntity> list) {
    docs = list;
  }
}