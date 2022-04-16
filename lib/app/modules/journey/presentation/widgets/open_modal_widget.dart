import 'package:flutter/material.dart';

import '../pages/islands/islands_bottomsheet_page.dart';

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
      children: [
        Align(
          alignment: const Alignment(0.8, 0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
              color: const Color(0xFF256380),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.expand_more,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        const IslandsBottomSheet(),
      ],
    )),
  );
}
