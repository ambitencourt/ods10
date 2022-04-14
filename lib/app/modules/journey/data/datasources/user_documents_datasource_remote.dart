import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

abstract class UserDocumentsDataSource {
  Future<List<DocumentEntity>> getUserDocuments(String id);
}
