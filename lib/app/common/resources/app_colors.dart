import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff628B9E);
  static const Color secondary = Color(0xffFFC727);
  static const Color background = Color(0xffE5E5E5);
  static const Color white = Color(0xffFFFFFF);
  static const Color whiteOpacity = Color(0xffBDBDBD);
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF" + hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
