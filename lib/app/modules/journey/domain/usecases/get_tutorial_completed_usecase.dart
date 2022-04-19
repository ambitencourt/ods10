import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';

abstract class GetTutorialCompletedUseCase {
  final UserIslandsRepository _userIslandsRepository;

  GetTutorialCompletedUseCase(this._userIslandsRepository);

  Future<bool> call();
}
