import 'package:flutter/material.dart';
import 'package:ods10/app/modules/journey/presentation/pages/islands_bottomsheet_page.dart';

showModal(context) {
  return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context) => const IslandsBottomSheet());
}
