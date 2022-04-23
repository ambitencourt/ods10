import 'package:ods10/app/modules/journey/data/datasources/user_documents_datasource.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/repositories/get_user_documents_repository.dart';

class GetUserDocumentsRepositoryImp implements GetUserDocumentsRepository {
  final UserDocumentsDataSource userDocumentsDataSource;

  GetUserDocumentsRepositoryImp(this.userDocumentsDataSource);
  @override
  Future<List<DocumentEntity>> call(String id) async {
    return await userDocumentsDataSource.getUserDocuments(id);
  }
}
