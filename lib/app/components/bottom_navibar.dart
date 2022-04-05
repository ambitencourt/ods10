import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/controllers/bottom_navibar_controller.dart';

class BottomNavibar extends StatelessWidget {
  const BottomNavibar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navibarController = Modular.get<BottomNavibarController>();
    return Observer(builder: (_) {
      return BottomNavigationBar(
        currentIndex: navibarController.store.index,
        onTap: (index) {
          navibarController.store.setIndex(index);
        },
        items: const [
          BottomNavigationBarItem(label: 'Início', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Perfil', icon: Icon(Icons.person)),
        ],
      );
    });
  }
}
