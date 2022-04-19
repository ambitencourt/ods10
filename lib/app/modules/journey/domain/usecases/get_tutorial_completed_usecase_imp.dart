import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';
import 'get_tutorial_completed_usecase.dart';

class GetTutorialCompletedUseCaseImp implements GetTutorialCompletedUseCase {
  final UserIslandsRepository _userIslandsRepository;

  GetTutorialCompletedUseCaseImp(this._userIslandsRepository);

  @override
  Future<bool> call() async {
    return await _userIslandsRepository.getTutorialCompleted();
  }
}
