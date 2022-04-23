class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.tel,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String tel;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['tel'] = tel;
    return _data;
  }
}
