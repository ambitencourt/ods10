import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/profile/presentation/controllers/profile_page_controller.dart';
import 'package:ods10/app/modules/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<Bind> get binds => [
        // CONTROLLERS
        Bind.factory(
          (i) => ProfilePageController(
            i<UserStore>(),
          ),
        ),
      ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const ProfilePage(),
        ),
      ];
}
