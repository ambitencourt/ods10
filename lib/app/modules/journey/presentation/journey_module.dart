import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/home_controller.dart';
import 'pages/home_page.dart';
import 'pages/journey_home.dart';

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
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/journey-home',
          transition: TransitionType.fadeIn,
          child: (context, args) => const JourneyHome(),
        ),
      ];
}
