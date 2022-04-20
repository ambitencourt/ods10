import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';
import 'interfaces/set_tutorial_completed_usecase.dart';

class SetTutorialCompletedUseCaseImp implements SetTutorialCompletedUseCase {
  final UserIslandsRepository _userIslandsRepository;

  SetTutorialCompletedUseCaseImp(this._userIslandsRepository);

  @override
  Future<bool> call() async {
    return await _userIslandsRepository.setTutorialCompleted();
  }
}
