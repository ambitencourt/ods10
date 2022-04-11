import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands_page.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const IslandsPage(),
        ),
      ];
}
