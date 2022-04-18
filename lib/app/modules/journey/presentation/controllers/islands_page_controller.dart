import 'package:carousel_slider/carousel_controller.dart';

import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_islands.usecase.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_page_store.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_store.dart';

class IslandsPageController {
  final IslandsStore islandsStore;
  final IslandsPageStore islandsPageStore;
  final GetUserIslandsUseCase _getUserIslandsUseCase;
  final CarouselController carouselController = CarouselController();

  IslandsPageController(
    this.islandsStore,
    this.islandsPageStore,
    this._getUserIslandsUseCase,
  );

  Future<void> getIslands() async {
    try {
      islandsPageStore.setHasError(false);
      islandsPageStore.setLoading(true);
      List<IslandEntity> islands =
          await _getUserIslandsUseCase('99fed5de-575b-40ec-aee8-01258aa596be');
      islandsStore.setIslandsList(islands);
    } catch (e) {
      islandsPageStore.setHasError(true);
      // rethrow;
    } finally {
      islandsPageStore.setLoading(false);
    }
  }
}
