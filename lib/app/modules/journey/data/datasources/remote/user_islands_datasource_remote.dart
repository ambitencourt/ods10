import 'package:dio/dio.dart';
import 'package:ods10/app/modules/journey/data/models/user_islands_model.dart';
import '../user_islands_datasource.dart';

class UserIslandsDataSourceRemote implements UserIslandsDataSource {
  final Dio api;

  UserIslandsDataSourceRemote(this.api);

  @override
  Future<List<UserIslandsModel>> getUserIslands(String id) async {
    List<UserIslandsModel> list = [];
    final response = await api.get('users/$id/islands');

    response.data.forEach((element) {
      list.add(UserIslandsModel.fromJson(element));
    });

    return list;
  }

  @override
  Future<UserIslandsModel> updateUserIslands(
    String id,
    String docId,
    String status,
  ) async {
    final response = await api.put(
      'users/$id/documents',
      data: {
        "document": docId,
        "status": status,
      },
    );
    return UserIslandsModel.fromJson(response.data);
  }
}
