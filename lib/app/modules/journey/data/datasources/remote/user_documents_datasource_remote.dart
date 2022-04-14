import 'package:dio/dio.dart';
import 'package:ods10/app/common/mapper/mapper.dart';
import 'package:ods10/app/modules/journey/data/models/user_documents_model.dart';
import 'package:ods10/app/modules/journey/domain/entities/document_entity.dart';

import '../user_documents_datasource_remote.dart';

class UserDocumentsDataSourceRemote implements UserDocumentsDataSource {
  final Mapper _mapper;
  final Dio api;

  UserDocumentsDataSourceRemote(this._mapper, this.api);

  @override
  Future<List<DocumentEntity>> getUserDocuments(String id) async {
    List<DocumentEntity> docs = [];
    final response = await api.get('user/$id/documents');

    response.data.forEach((element) {
      UserDocumentsModel doc = UserDocumentsModel.fromJson(element);
      docs.add(_mapper.toEntity(doc));
    });

    return docs;
  }
}