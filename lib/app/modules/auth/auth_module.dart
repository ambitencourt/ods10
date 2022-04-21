import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/auth/data/datasources/remote/user_remote_datasource.dart';
import 'package:ods10/app/modules/auth/data/datasources/user_datasources.dart';
import 'package:ods10/app/modules/auth/data/repositories/user_repository_imp.dart';
import 'package:ods10/app/modules/auth/domain/repositories/user_repository.dart';
import 'package:ods10/app/modules/auth/domain/usecases/get_user_usecase.dart';
import 'package:ods10/app/modules/auth/domain/usecases/get_user_usecase_imp.dart';
import 'package:ods10/app/modules/auth/presentation/controllers/splash_controller.dart';
import 'package:ods10/app/modules/auth/presentation/pages/splash_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        // DATABASES
        Bind.factory<UserDataSource>((i) => UserRemoteDataSource(i<Dio>())),

        // REPOSITORIES
        Bind.factory<UserRepository>(
            (i) => UserRepositoryImp(i<UserDataSource>())),

        //USECASES
        Bind.factory<GetUserUserCase>((i) => GetUserUserCaseImp(i())),

        // CONTROLLERS
        Bind.factory(
          (i) => SplashController(
            userStore: i<UserStore>(),
            getUserUseCase: i(),
          ),
        ),
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
