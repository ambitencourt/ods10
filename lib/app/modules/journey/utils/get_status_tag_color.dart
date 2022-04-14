import 'package:flutter/material.dart';
import 'package:ods10/app/common/resources/app_colors.dart';

Color getStatusTagColor(String status) {
  switch (status) {
    case 'requested':
      return AppColors.requested;
    case 'ready':
      return AppColors.ready;
    case 'missing':
      return AppColors.missing;
    default:
      return AppColors.primary;
  }
}

Color getPriceTagColor(double value) {
  return value > 0 ? AppColors.paid : AppColors.free;
}
