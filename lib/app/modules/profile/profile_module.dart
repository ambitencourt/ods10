import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/modules/profile/presentation/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const ProfilePage(),
        ),
      ];
}
