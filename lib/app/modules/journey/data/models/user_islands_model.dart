import 'user_documents_model.dart';

class UserIslandsModel {
  UserIslandsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.documents,
  });
  late final String id;
  late final String name;
  late final String description;
  late final List<UserDocumentsModel> documents;

  UserIslandsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    documents = List.from(json['documents'])
        .map((e) => UserDocumentsModel.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['id'] = id;
    _data['description'] = description;
    _data['documents'] = documents.map((e) => e.toJson()).toList();
    return _data;
  }
}
