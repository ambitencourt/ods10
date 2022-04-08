class DocumentEntity {
  String id;
  String name;
  String description;
  double price;
  String link;
  String location;
  String duration;
  int order;
  String status;

  DocumentEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.link,
    required this.location,
    required this.duration,
    required this.order,
    required this.status,
  });
}
