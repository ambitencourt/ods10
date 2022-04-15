import 'package:ods10/app/common/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String id);
}
