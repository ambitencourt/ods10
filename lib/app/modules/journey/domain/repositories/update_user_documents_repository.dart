import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

abstract class UpdateUserDocumentsRepository {
  Future<DocumentEntity> call(String id, String docId, String status);
}
