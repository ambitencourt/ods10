import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/controllers/bottom_navibar_controller.dart';

class BottomNavibar extends StatefulWidget {
  const BottomNavibar({Key? key}) : super(key: key);

  @override
  State<BottomNavibar> createState() => _BottomNavibarState();
}

class _BottomNavibarState
    extends ModularState<BottomNavibar, BottomNavibarController> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return BottomNavigationBar(
        currentIndex: controller.store.index,
        onTap: (index) {
          controller.navigateToModule(index);
        },
        items: const [
          BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person)),
        ],
      );
    });
  }
}
