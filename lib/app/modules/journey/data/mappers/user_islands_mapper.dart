import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/models/user_documents_model.dart';
import 'package:ods10/app/modules/journey/data/models/user_islands_model.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';

class UserIslandsMapper implements Mapper<IslandEntity, UserIslandsModel> {
  @override
  fromEntity(object) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  toEntity(UserIslandsModel object) => IslandEntity(
        id: object.id,
        name: object.name,
        description: object.description,
      );
}
