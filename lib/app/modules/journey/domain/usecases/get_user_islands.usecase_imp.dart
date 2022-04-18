import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';
import 'package:ods10/app/modules/journey/domain/usecases/get_user_islands.usecase.dart';

class GetUserIslandsUseCaseImp implements GetUserIslandsUseCase {
  final UserIslandsRepository _userIslandsRepository;

  GetUserIslandsUseCaseImp(this._userIslandsRepository);
  @override
  Future<List<IslandEntity>> call(String id) async {
    return await _userIslandsRepository.getIslands(id);
  }
}
