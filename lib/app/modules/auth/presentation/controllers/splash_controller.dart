import 'package:ods10/app/common/entities/user_entity.dart';
import 'package:ods10/app/common/stores/user_store.dart';
import 'package:ods10/app/modules/auth/domain/usecases/get_user_usecase.dart';

class SplashController {
  UserStore userStore;
  GetUserUserCase getUserUseCase;
  SplashController({
    required this.userStore,
    required this.getUserUseCase,
  });

  Future<void> getUser() async {
    final user = await getUserUseCase('99fed5de-575b-40ec-aee8-01258aa596be');
    userStore.setUser(user);
  }
}
