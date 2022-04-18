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
}
