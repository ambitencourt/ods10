import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/auth/auth_module.dart';
import 'package:ods10/app/modules/content/content_module.dart';
import 'common/controllers/bottom_navibar_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/journey/journey_module.dart';
import 'modules/profile/profile_module.dart';
import 'stores/bottom_navibar_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => BottomNavibarStore()),
        Bind.factory((i) => BottomNavibarController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthModule(),
        ),
        // ModuleRoute(
        //   '/home',
        //   module: HomeModule(),
        // ),
        ModuleRoute(
          '/journey',
          transition: TransitionType.fadeIn,
          module: JourneyModule(),
        ),
        ModuleRoute(
          '/profile',
          module: ProfileModule(),
        ),
        // ModuleRoute(
        //   '/content',
        //   transition: TransitionType.fadeIn,
        //   module: ContentModule(),
        // ),
      ];
}
