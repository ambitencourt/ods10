import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/auth/auth_module.dart';
import 'package:ods10/app/modules/journey/presentation/journey_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        //Bind.factory((i) => HomeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/journey-module',
          transition: TransitionType.fadeIn,
          module: JourneyModule(),
        ),
      ];
}
