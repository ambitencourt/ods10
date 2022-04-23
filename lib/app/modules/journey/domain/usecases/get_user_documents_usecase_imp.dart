import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/repositories/get_user_documents_repository.dart';
import 'interfaces/get_user_documents_usecase.dart';

class GetUserDocumentsUseCaseImp implements GetUserDocumentsUseCase {
  final GetUserDocumentsRepository _getUserDocumentsRepository;

  GetUserDocumentsUseCaseImp(this._getUserDocumentsRepository);
  @override
  Future<List<DocumentEntity>> call(String id) async {
    return await _getUserDocumentsRepository(id);
  }
}
