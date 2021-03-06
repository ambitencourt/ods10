import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/datasources/preferences_datasource.dart';
import 'package:ods10/app/modules/journey/data/datasources/user_islands_datasource.dart';
import 'package:ods10/app/modules/journey/data/models/user_islands_model.dart';
import 'package:ods10/app/modules/journey/domain/entities/island_entity.dart';
import 'package:ods10/app/modules/journey/domain/repositories/user_islands_repository.dart';

class UserIslandsRepositoryImp implements UserIslandsRepository {
  final UserIslandsDataSource _userIslandsDataSource;
  final PreferencesDataSource _preferencesDataSource;
  final Mapper _mapper;

  UserIslandsRepositoryImp(
    this._userIslandsDataSource,
    this._preferencesDataSource,
    this._mapper,
  );

  @override
  Future<List<IslandEntity>> getIslands(String userId) async {
    List<IslandEntity> finalList = [];
    List<UserIslandsModel> list =
        await _userIslandsDataSource.getUserIslands(userId);

    for (var element in list) {
      finalList.add(_mapper.toEntity(element));
    }
    return finalList;
  }

  @override
  Future<bool> getTutorialCompleted() async {
    return await _preferencesDataSource.getTutorialCompleted();
  }

  @override
  Future<bool> setTutorialCompleted() async {
    return await _preferencesDataSource.setTutorialCompleted();
  }
}
