import 'package:carousel_slider/carousel_controller.dart';
import 'package:ods10/app/modules/journey/presentation/stores/islands_page_store.dart';

class IslandsPageController {
  final IslandsPageStore islandsPageStore;
  final CarouselController carouselController = CarouselController();

  IslandsPageController(this.islandsPageStore);
}
