import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';

abstract class UserIslandsRepository {
  Future<List<IslandEntity>> getIslands(String userId);
}
