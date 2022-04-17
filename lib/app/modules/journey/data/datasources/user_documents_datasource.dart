import 'package:ods10/app/modules/journey/data/models/user_documents_model.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

abstract class UserDocumentsDataSource {
  Future<List<DocumentEntity>> getUserDocuments(String id);

  Future<UserDocumentsModel> updateUserDocuments(
      String id, String docId, String status);
}
