import 'package:mobx/mobx.dart';
import 'package:ods10/app/common/entities/user_entity.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  UserEntity? user;

  @action
  setUser(UserEntity value) => user = value;
}
