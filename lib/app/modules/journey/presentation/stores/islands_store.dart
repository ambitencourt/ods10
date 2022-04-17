import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
part 'islands_store.g.dart';

class IslandsStore = _IslandsStoreBase with _$IslandsStore;

abstract class _IslandsStoreBase with Store {
  ObservableList<IslandEntity> islands = ObservableList<IslandEntity>();

  @action
  void setIslandsList(List<IslandEntity> list) {
    islands = ObservableList<IslandEntity>.of(list);
  }
}
