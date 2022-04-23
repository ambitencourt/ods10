import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/stores/bottom_navibar_store.dart';

class BottomNavibarController {
  BottomNavibarStore store;

  BottomNavibarController(
    this.store,
  );

  void updateIndex(int value) {
    store.setIndex(value);
  }

  void navigateToModule(int index) {
    store.setIndex(index);
    switch (index) {
      case 0:
        Modular.to.navigate('/journey/');
        break;
      case 1:
        Modular.to.navigate('/profile/');
        break;
      default:
    }
  }
}
