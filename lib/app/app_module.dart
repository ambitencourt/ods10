import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/auth/auth_module.dart';
import 'package:ods10/app/modules/content/content_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: AuthModule(),
        ),
        ModuleRoute(
          '/content',
          transition: TransitionType.fadeIn,
          module: ContentModule(),
        ),
      ];
}
