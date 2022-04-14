import 'package:ods10/app/modules/journey/domain/enums/document_status_enum.dart';

String translateStatus(String status) {
  switch (status) {
    case 'requested':
      return 'Solicitado';
    case 'ready':
      return 'Recebido';
    case 'missing':
      return 'Pendente';
    default:
      return '';
  }
}

String translateStatusEnum(DocumentStatusEnum status) {
  switch (status) {
    case DocumentStatusEnum.requested:
      return 'Solicitado';
    case DocumentStatusEnum.ready:
      return 'Recebido';
    case DocumentStatusEnum.missing:
      return 'Pendente';
    default:
      return '';
  }
}

String translatePrice(double value) {
  return value > 0 ? 'Pago' : 'Gratuito';
}
