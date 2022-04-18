import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
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
}
