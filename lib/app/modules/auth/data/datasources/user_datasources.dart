import 'package:ods10/app/common/resources/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> getUser(String id);
}
