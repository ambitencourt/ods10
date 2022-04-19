import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/journey/data/datasources/remote/user_documents_datasource_remote.dart';
import 'package:ods10/app/modules/journey/data/datasources/remote/user_islands_datasource_remote.dart';
import 'package:ods10/app/modules/journey/data/datasources/user_documents_datasource.dart';
import 'package:ods10/app/modules/journey/data/datasources/user_islands_datasource.dart';
import 'package:ods10/app/modules/journey/data/mappers/user_islands_mapper.dart';
import 'package:ods10/app/modules/journey/data/repositories/get_user_documents_repository_imp.dart';
import 'package:ods10/app/modules/journey/data/repositories/update_user_documents_repository_imp.dart';
import 'package:ods10/app/modules/journey/data/repositories/user_islands_repository_imp.dart';
import 'package:ods10/app/modules/journey/domain/repositories/get_user_documents_repository.dart';
import 'package:ods10/app/modules/journey/domain/repositories/update_user_documents_repository.dart';
import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_documents_usecase%20_imp.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_islands.usecase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_islands.usecase_imp.dart';
import 'package:ods10/app/modules/journey/domain/usecases/update_user_document_useacase.dart';
import 'package:ods10/app/modules/journey/domain/usecases/update_user_document_useacase_imp.dart';
import 'package:ods10/app/modules/journey/presentation/controllers/islands_page_controller.dart';
import 'package:ods10/app/modules/journey/presentation/pages/documents/list_documents.dart';
import 'package:ods10/app/modules/journey/presentation/pages/home_page.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands/gaming%20documents/free%20island/change_state.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands/gaming%20documents/free%20island/exit_island.dart';
import 'package:ods10/app/modules/journey/presentation/stores/documents_store.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands/gaming%20documents/tutorial/tutorial_page.dart';
import 'package:ods10/app/modules/journey/presentation/stores/home_store.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_page_store.dart';

import 'data/mappers/user_document_mapper.dart';

import 'domain/usecases/get_user_documents_usecase.dart';

import 'presentation/controllers/home_controller.dart';

import 'presentation/pages/islands/gaming documents/document_details_page.dart';
import 'presentation/pages/islands/islands_page.dart';
import 'presentation/stores/islands_store.dart';

class JourneyModule extends Module {
  @override
  List<Bind> get binds => [
        //Stores
        Bind.factory<HomeStore>((i) => HomeStore()),
        Bind.factory<IslandsPageStore>((i) => IslandsPageStore()),
        Bind.singleton<DocumentsStore>((i) => DocumentsStore()),
        Bind.singleton<IslandsStore>((i) => IslandsStore()),

        //Mappers
        Bind.factory<Mapper>((i) => UserDocumentMapper()),
        Bind.factory<Mapper>(
          (i) => UserIslandsMapper(
            i<UserDocumentMapper>(),
          ),
        ),

        // DATABASES
        Bind.factory<UserDocumentsDataSource>(
          (i) => UserDocumentsDataSourceRemote(
            i<UserDocumentMapper>(),
            i<Dio>(),
          ),
        ),

        Bind.factory<UserIslandsDataSource>(
          (i) => UserIslandsDataSourceRemote(
            i<Dio>(),
          ),
        ),

        // REPOSITORIES
        Bind.factory<GetUserDocumentsRepository>(
            (i) => GetUserDocumentsRepositoryImp(i())),
        Bind.factory<UpdateUserDocumentsRepository>(
          (i) => UpdateUserDocumentsRepositoryImp(
            i(),
            i<UserDocumentMapper>(),
          ),
        ),

        Bind.factory<UserIslandsRepository>(
          (i) => UserIslandsRepositoryImp(
            i<UserIslandsDataSource>(),
            i<UserIslandsMapper>(),
          ),
        ),

        //USECASES
        Bind.factory<GetUserDocumentsUseCase>(
            (i) => GetUserDocumentsUseCaseImp(i())),
        Bind.factory<UpdateUserDocumentsUseCase>(
            (i) => UpdateUserDocumentsUseCaseImp(i())),
        Bind.factory<GetUserIslandsUseCase>(
            (i) => GetUserIslandsUseCaseImp(i())),

        // CONTROLLERS
        Bind.factory((i) => HomeController(
              i<HomeStore>(),
              i<IslandsStore>(),
              i<UserStore>(),
              i<UpdateUserDocumentsUseCase>(),
              i<GetUserIslandsUseCase>(),
            )),
        Bind.factory((i) => IslandsPageController(
              i<UserStore>(),
              i<IslandsStore>(),
              i<IslandsPageStore>(),
              i<GetUserIslandsUseCase>(),
            )),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          transition: TransitionType.fadeIn,
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/documents',
          transition: TransitionType.fadeIn,
          child: (context, args) => DocumentsList(
            islandId: args.data,
          ),
        ),
        ChildRoute(
          '/tutorial',
          transition: TransitionType.fadeIn,
          child: (context, args) => const TutorialPage(),
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
        ChildRoute(
          '/change-state',
          transition: TransitionType.fadeIn,
          child: (context, args) => const ChangeState(),
        ),
        ChildRoute(
          '/exit-island',
          transition: TransitionType.fadeIn,
          child: (context, args) => const ExitIsland(),
        ),
      ];
}
