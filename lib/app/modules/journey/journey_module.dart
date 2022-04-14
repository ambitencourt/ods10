import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/datasources/remote/user_documents_datasource_remote.dart';
import 'package:ods10/app/modules/journey/data/datasources/user_documents_datasource_remote.dart';
import 'package:ods10/app/modules/journey/data/repositories/get_user_documents_repository_imp.dart';
import 'package:ods10/app/modules/journey/domain/repositories/get_user_documents_repository.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase%20_imp.dart';
import 'package:ods10/app/modules/journey/presentation/pages/document_details_page.dart';
import 'package:ods10/app/modules/journey/presentation/pages/home_page.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands_page.dart';
import 'package:ods10/app/modules/journey/presentation/stores/home_store.dart';

import 'data/mappers/user_document_mapper.dart';
import 'domain/usecases/get_user_documents_usecase.dart';
import 'presentation/controllers/home_controller.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        //Stores
        Bind.singleton<HomeStore>((i) => HomeStore()),

        //Mappers
        Bind.factory<Mapper>((i) => UserDocumentMapper()),

        // DATABASES
        Bind.factory<UserDocumentsDataSource>(
            (i) => UserDocumentsDataSourceRemote(i(), i())),

        // REPOSITORIES
        Bind.factory<GetUserDocumentsRepository>(
            (i) => GetUserDocumentsRepositoryImp(i())),

        //USECASES
        Bind.factory<GetUserDocumentsUseCase>(
            (i) => GetUserDocumentsUseCaseImp(i())),

        // CONTROLLERS
        Bind.factory((i) =>
            HomeController(i<GetUserDocumentsUseCase>(), i<HomeStore>())),
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
        ChildRoute(
          '/details',
          transition: TransitionType.fadeIn,
          child: (context, args) => const DocumentDetaills(),
        ),
      ];
}
