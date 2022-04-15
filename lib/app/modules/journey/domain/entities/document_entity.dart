class DocumentEntity {
  String id;
  String name;
  String shortDescription;
  String fullDescription;
  double price;
  String link;
  String location;
  String duration;
  // int order;
  String status;

  DocumentEntity({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.price,
    required this.link,
    required this.location,
    required this.duration,
    //  required this.order,
    required this.status,
  });
}
