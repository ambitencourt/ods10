import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/resources/app_colors.dart';
import 'package:ods10/app/common/widgets/bottom_navibar.dart';
import 'package:ods10/app/modules/profile/presentation/controllers/profile_page_controller.dart';
import 'package:ods10/app/modules/profile/presentation/widgets/info_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState
    extends ModularState<ProfilePage, ProfilePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            InfoWidget(title: 'Nome', info: controller.userStore.user?.name),
            InfoWidget(title: 'E-mail', info: controller.userStore.user?.email),
            InfoWidget(title: 'Telefone', info: controller.userStore.user?.tel),
          ],
        ),
      ),
      backgroundColor: AppColors.background,
      bottomNavigationBar: const BottomNavibar(),
    );
  }
}
