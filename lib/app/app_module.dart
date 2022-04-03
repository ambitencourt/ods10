import 'package:flutter_modular/flutter_modular.dart';

import 'modules/presentation/home/home_page.dart';
import 'modules/presentation/splashscreen/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ChildRoute(
          '/home',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
      ];
}
