import 'package:flutter_modular/flutter_modular.dart';

import 'pages/home/home_page.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        //Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/home',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
      ];
}
