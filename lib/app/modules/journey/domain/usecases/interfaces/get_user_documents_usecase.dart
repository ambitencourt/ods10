import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

abstract class GetUserDocumentsUseCase {
  Future<List<DocumentEntity>> call(String id);
}
