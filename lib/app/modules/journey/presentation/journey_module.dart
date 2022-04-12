import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands_page.dart';

import '../../home/presentation/home/home_controller.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const IslandsPage(),
        ),
      ];
}
