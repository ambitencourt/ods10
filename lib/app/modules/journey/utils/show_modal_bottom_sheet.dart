import 'package:flutter/material.dart';

showPersonalModalBottomSheet(BuildContext context, Widget child) async {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: context,
    builder: (context) {
      return SizedBox(
        // height: MediaQuery.of(context).size.height * 0.5,
        child: child,
      );
    },
  );
}
