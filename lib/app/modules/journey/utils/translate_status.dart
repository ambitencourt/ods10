String translateStatus(String status) {
  switch (status) {
    case 'requested':
      return 'Solicitado';
    case 'received':
      return 'Recebido';
    case 'missing':
      return 'Pendente';
    default:
      return '';
  }
}

String translatePrice(double value) {
  return value > 0 ? 'Pago' : 'Gratuito';
}
