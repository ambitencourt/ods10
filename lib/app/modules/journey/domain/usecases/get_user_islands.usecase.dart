import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';

abstract class GetUserIslandsUseCase {
  Future<List<IslandEntity>> call(String id);
}
