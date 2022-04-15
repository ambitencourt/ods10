import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String? title;
  final String? info;
  const InfoWidget({
    Key? key,
    required this.title,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title ?? ''),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Text(info ?? ''),
      ),
    );
  }
}
