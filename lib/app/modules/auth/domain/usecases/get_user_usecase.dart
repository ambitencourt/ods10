import 'package:ods10/app/common/entities/user_entity.dart';

abstract class GetUserUserCase {
  Future<UserEntity> call(String id);
}
