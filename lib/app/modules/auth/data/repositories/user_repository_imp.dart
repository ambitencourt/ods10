import 'package:ods10/app/common/entities/user_entity.dart';
import 'package:ods10/app/modules/auth/data/datasources/user_datasources.dart';
import 'package:ods10/app/modules/auth/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImp(this.userDataSource);

  @override
  Future<UserEntity> getUser(String id) async {
    final user = await userDataSource.getUser(id);
    return UserEntity(
      id: user.id,
      name: user.name,
      email: user.email,
      tel: user.tel,
    );
  }
}
