import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/journey/presentation/pages/home_page.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands_page.dart';

import 'domain/usecases/get_user_documents_usecase.dart';
import 'presentation/controllers/home_controller.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i<GetUserDocumentsUseCase>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/islands',
          transition: TransitionType.fadeIn,
          child: (context, args) => const IslandsPage(),
        ),
      ];
}
