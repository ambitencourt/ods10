import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/home/home_controller.dart';
import 'presentation/pages/home/home_page.dart';

class HomeModule extends Module {
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
      ];
}
