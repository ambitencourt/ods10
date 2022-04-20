import 'package:carousel_slider/carousel_controller.dart';

import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/domain/usecases/interfaces/get_user_islands.usecase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_page_store.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_store.dart';

class IslandsPageController {
  final UserStore userStore;
  final IslandsStore islandsStore;
  final IslandsPageStore islandsPageStore;
  final GetUserIslandsUseCase _getUserIslandsUseCase;
  final CarouselController carouselController = CarouselController();

  IslandsPageController(
    this.userStore,
    this.islandsStore,
    this.islandsPageStore,
    this._getUserIslandsUseCase,
  );

  Future<void> getIslands() async {
    try {
      islandsPageStore.setHasError(false);
      islandsPageStore.setLoading(true);
      List<IslandEntity> islands =
          await _getUserIslandsUseCase(userStore.user!.id);
      islandsStore.setIslandsList(islands);
    } catch (e) {
      islandsPageStore.setHasError(true);
      // rethrow;
    } finally {
      islandsPageStore.setLoading(false);
    }
  }
}
