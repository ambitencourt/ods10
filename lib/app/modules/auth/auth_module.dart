import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/auth/presentation/pages/splash_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        //Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          // child: (context, args) => const JourneyHome(),
          child: (context, args) => const SplashPage(),
        ),
      ];
}
