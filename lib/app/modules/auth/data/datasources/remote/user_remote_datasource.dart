import 'package:dio/dio.dart';
import 'package:ods10/app/common/resources/user_model.dart';
import 'package:ods10/app/modules/auth/data/datasources/user_datasources.dart';

class UserRemoteDataSource implements UserDataSource {
  final Dio api;

  UserRemoteDataSource(this.api);

  @override
  Future<UserModel> getUser(String id) async {
    final response = await api.get('users/$id');
    return UserModel.fromJson(response.data);
  }
}
