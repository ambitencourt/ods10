import 'package:ods10/app/common/resources/preferences_strings.dart';
import 'package:ods10/app/modules/journey/data/datasources/preferences_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesDataSourceLocal implements PreferencesDataSource {
  final SharedPreferences _storage;

  PreferencesDataSourceLocal(this._storage);

  @override
  Future<bool> getTutorialCompleted() async {
    return _storage.getBool(TUTORIAL_COMPLETED_KEY) ?? false;
  }

  @override
  Future<bool> setTutorialCompleted() async {
    return await _storage.setBool(TUTORIAL_COMPLETED_KEY, true);
  }
}
