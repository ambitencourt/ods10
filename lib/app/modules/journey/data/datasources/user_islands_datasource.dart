import 'package:ods10/app/modules/journey/data/models/user_islands_model.dart';

abstract class UserIslandsDataSource {
  Future<List<UserIslandsModel>> getUserIslands(String id);

  Future<UserIslandsModel> updateUserIslands(
      String id, String docId, String status);
}
