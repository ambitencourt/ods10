class UserDocumentsModel {
  UserDocumentsModel({
    required this.document,
    required this.status,
  });
  late final Document document;
  late final String status;

  UserDocumentsModel.fromJson(Map<String, dynamic> json) {
    document = Document.fromJson(json['document']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['document'] = document.toJson();
    _data['status'] = status;
    return _data;
  }
}

class Document {
  Document({
    required this.id,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.price,
    required this.link,
    required this.location,
    required this.duration,
    required this.island,
  });
  late final String id;
  late final String name;
  late final String shortDescription;
  late final String fullDescription;
  late final double price;
  late final String? link;
  late final String? location;
  late final String? duration;
  late final Island island;

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    fullDescription = json['fullDescription'];
    price = json['price'].toDouble();
    link = json['link'];
    location = json['location'];
    duration = json['duration'];
    island = Island.fromJson(json['island']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['shortDescription'] = shortDescription;
    _data['fullDescription'] = fullDescription;
    _data['price'] = price;
    _data['link'] = link;
    _data['location'] = location;
    _data['duration'] = duration;
    _data['island'] = island.toJson();
    return _data;
  }
}

class Island {
  Island({
    required this.id,
    required this.name,
    required this.description,
  });
  late final String id;
  late final String name;
  late final String description;

  Island.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    return _data;
  }
}
