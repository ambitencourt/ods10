import 'package:mobx/mobx.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
part 'islands_store.g.dart';

class IslandsStore = _IslandsStoreBase with _$IslandsStore;

abstract class _IslandsStoreBase with Store {
  ObservableList<IslandEntity> islands = ObservableList<IslandEntity>();

  @action
  void setIslandsList(List<IslandEntity> list) {
    islands = ObservableList<IslandEntity>.of(list);
  }

  @computed
  List<double> get percentDone {
    List<double> percentDone = [];
    for (var island in islands) {
      int docsDone = 0;

      for (var document in island.documents!) {
        if (document.status == 'ready') docsDone++;
      }
      percentDone.add(docsDone / island.documents!.length);
      docsDone = 0;
    }
    return percentDone;
  }

  @computed
  List<int> get docsReady {
    List<int> docsReady = [];
    for (var island in islands) {
      int docsDone = 0;

      for (var document in island.documents!) {
        if (document.status == 'ready') docsDone++;
      }
      docsReady.add(docsDone);
      docsDone = 0;
    }
    return docsReady;
  }

  @computed
  List<DocumentEntity> get docs {
    List<DocumentEntity> docsList = [];
    for (var element in islands) {
      docsList.addAll(element.documents!);
    }
    return docsList;
  }
}
