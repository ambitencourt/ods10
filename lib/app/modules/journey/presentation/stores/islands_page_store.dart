import 'package:mobx/mobx.dart';
part 'islands_page_store.g.dart';

class IslandsPageStore = _IslandsPageStoreBase with _$IslandsPageStore;

abstract class _IslandsPageStoreBase with Store {
  @observable
  int current = 0;
  @action
  setCurrentIndex(int value) => current = value;
  @observable
  double progressValue = 0.0;
  @action
  setProgressValue(double value) => progressValue = value;

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
