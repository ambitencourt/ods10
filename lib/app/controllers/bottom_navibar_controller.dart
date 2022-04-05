import 'package:ods10/app/stores/bottom_navibar_store.dart';

class BottomNavibarController {
  BottomNavibarStore store;

  BottomNavibarController(
    this.store,
  );

  void updateIndex(int value) {
    store.setIndex(value);
  }
}
