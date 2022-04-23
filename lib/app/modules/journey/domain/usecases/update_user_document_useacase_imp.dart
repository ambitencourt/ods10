import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';
import 'package:ods10/app/modules/journey/domain/repositories/update_user_documents_repository.dart';
import 'interfaces/update_user_document_useacase.dart';

class UpdateUserDocumentsUseCaseImp implements UpdateUserDocumentsUseCase {
  final UpdateUserDocumentsRepository _updateUserDocumentsRepository;

  UpdateUserDocumentsUseCaseImp(this._updateUserDocumentsRepository);

  @override
  Future<DocumentEntity> call(
      String id, String docId, DocumentStatusEnum status) async {
    switch (status) {
      case DocumentStatusEnum.missing:
        return await _updateUserDocumentsRepository(id, docId, 'missing');
      case DocumentStatusEnum.requested:
        return await _updateUserDocumentsRepository(id, docId, 'requested');
      case DocumentStatusEnum.ready:
        return await _updateUserDocumentsRepository(id, docId, 'ready');
      default:
        throw ('Document Status missing');
    }
  }
}
