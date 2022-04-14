import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/datasources/user_documents_datasource_remote.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';
import 'package:ods10/app/modules/journey/domain/repositories/update_user_documents_repository.dart';

class UpdateUserDocumentsRepositoryImp
    implements UpdateUserDocumentsRepository {
  final UserDocumentsDataSource userDocumentsDataSource;
  final Mapper _mapper;

  UpdateUserDocumentsRepositoryImp(this.userDocumentsDataSource, this._mapper);

  @override
  Future<DocumentEntity> call(String id, String docId, String status) async {
    final docModel =
        await userDocumentsDataSource.updateUserDocuments(id, docId, status);
    return _mapper.toEntity(docModel);
  }
}
