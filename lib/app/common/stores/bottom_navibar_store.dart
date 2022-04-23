import 'package:mobx/mobx.dart';
part 'bottom_navibar_store.g.dart';

class BottomNavibarStore = _BottomNavibarStoreBase with _$BottomNavibarStore;

abstract class _BottomNavibarStoreBase with Store {
  @observable
  int index = 0;
  @action
  setIndex(int value) => index = value;
}
