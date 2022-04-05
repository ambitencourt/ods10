import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final double? height;
  final TextAlign? align;
  const TextWidget({
    Key? key,
    required this.data,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    this.height,
    this.align,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: align,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}
