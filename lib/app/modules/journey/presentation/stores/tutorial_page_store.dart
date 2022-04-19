import 'package:mobx/mobx.dart';
part 'tutorial_page_store.g.dart';

class TutoriaPageStore = _TutoriaPageStoreBase with _$TutoriaPageStore;

abstract class _TutoriaPageStoreBase with Store {
  @observable
  int current = 0;
  @action
  setCurrentIndex(int value) => current = value;
  @computed
  double get percentCompleted => current.toDouble() / 2;
}
