import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/models/user_documents_model.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';

class UserDocumentMapper implements Mapper<DocumentEntity, UserDocumentsModel> {
  @override
  fromEntity(object) {
    // TODO: implement fromEntity
    throw UnimplementedError();
  }

  @override
  toEntity(UserDocumentsModel object) => DocumentEntity(
        id: object.document.id,
        name: object.document.name,
        shortDescription: object.document.shortDescription,
        fullDescription: object.document.fullDescription,
        price: object.document.price,
        link: object.document.link,
        location: object.document.location,
        duration: object.document.duration,
        status: object.status,
        island: IslandEntity(
            id: object.document.island.id,
            name: object.document.island.name,
            description: object.document.island.description),
      );
}
