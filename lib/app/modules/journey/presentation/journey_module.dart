import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/journey/presentation/pages/home/journey_home.dart';

import 'controllers/home_controller.dart';
import 'pages/home/home_page.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/home',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/journey-home',
          transition: TransitionType.fadeIn,
          child: (context, args) => const JourneyHome(),
        ),
      ];
}
