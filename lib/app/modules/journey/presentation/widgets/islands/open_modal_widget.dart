import 'package:flutter/material.dart';

import '../../pages/islands/islands_bottomsheet_page.dart';

void openModal(context) {
  final mediaQuery = MediaQuery.of(context).size;
  showModalBottomSheet(
    barrierColor: const Color.fromARGB(50, 50, 50, 50),
    constraints: BoxConstraints(
      maxHeight: mediaQuery.height * .65,
    ),
    elevation: 15,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
    ),
    context: context,
    builder: (context) => SingleChildScrollView(
        child: Stack(
      alignment: const Alignment(0, -1.2),
      children: const [
        IslandsBottomSheet(),
      ],
    )),
  );
}
