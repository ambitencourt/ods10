import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

class IslandEntity {
  String id;
  String name;
  String description;
  List<DocumentEntity>? documents;

  IslandEntity({
    required this.id,
    required this.name,
    required this.description,
    this.documents,
  });
}
