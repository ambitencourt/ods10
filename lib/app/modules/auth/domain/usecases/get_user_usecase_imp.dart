import 'package:ods10/app/common/entities/user_entity.dart';
import 'package:ods10/app/modules/auth/domain/repositories/user_repository.dart';
import 'package:ods10/app/modules/auth/domain/usecases/get_user_usecase.dart';

class GetUserUserCaseImp implements GetUserUserCase {
  final UserRepository userRepository;

  GetUserUserCaseImp(this.userRepository);

  @override
  Future<UserEntity> call(String id) async {
    return await userRepository.getUser(id);
  }
}
