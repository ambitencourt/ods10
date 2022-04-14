import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xff256380);
  static const Color secondary = Color(0xffE36E82);
  static const Color missing = Color(0xffD03363);
  static const Color requested = Color(0xff2C61B0);
  static const Color free = Color(0xff86249E);
  static const Color ready = Color(0xff1C7A2F);
  static const Color paid = Color(0xffBD4815);
  static const Color background = Color(0xffFBFBFB);
  static const Color grey = Color(0xffDDDDDD);
  static const Color ligthGrey = Color(0xffCFCAE4);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color ligthBlack = Color(0xff2B2B2B);
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
