import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/content/presentation/pages/content_page.dart';
import 'package:ods10/app/modules/journey/journey_module.dart';
import 'package:ods10/app/modules/profile/profile_module.dart';

class ContentModule extends Module {
  @override
  List<Bind> get binds => [];

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
