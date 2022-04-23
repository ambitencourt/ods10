import 'package:flutter/material.dart';
import '../../pages/islands/gaming%20documents/laerte_coutinho/confirm_received_page.dart';

void confirmReceived(context) {
  final mediaQuery = MediaQuery.of(context).size;
  showModalBottomSheet(
    barrierColor: const Color.fromARGB(50, 50, 50, 50),
    constraints: BoxConstraints(
      maxHeight: mediaQuery.height * .75,
    ),
    elevation: 15,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    context: context,
    builder: (context) => const SingleChildScrollView(
      child: ConfirmReceivedPage(),
    ),
  );
}
