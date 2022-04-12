import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/controllers/bottom_navibar_controller.dart';
import 'package:ods10/app/modules/content/presentation/pages/content_page.dart';
import 'package:ods10/app/modules/journey/journey_module.dart';
import 'package:ods10/app/modules/profile/profile_module.dart';
import 'package:ods10/app/stores/bottom_navibar_store.dart';

class ContentModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.factory((i) => BottomNavibarStore()),
        // Bind.factory((i) => BottomNavibarController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const ContentPage(),
          children: [
            ModuleRoute(
              '/journey',
              module: JourneyModule(),
            ),
            ModuleRoute(
              '/profile',
              module: ProfileModule(),
            )
          ],
        ),
      ];
}
