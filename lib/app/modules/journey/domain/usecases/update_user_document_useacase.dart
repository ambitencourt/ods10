import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';

abstract class UpdateUserDocumentsUseCase {
  Future<DocumentEntity> call(
      String id, String docId, DocumentStatusEnum status);
}
