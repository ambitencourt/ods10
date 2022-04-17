import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';

class DocumentEntity {
  String id;
  String name;
  String shortDescription;
  String fullDescription;
  double price;
  String? link;
  String? location;
  String? duration;
  // int order;
  String status;
  IslandEntity island;

  DocumentEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.price,
    required this.link,
    required this.location,
    required this.duration,
    required this.status,
    required this.island,
  });
}
