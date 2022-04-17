import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextStyle getBoldStyle({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w700,
  Color color = AppColors.primary,
  TextDecoration? decoration,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getBoldStyleW900({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w900,
  Color color = AppColors.primary,
  TextDecoration? decoration,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    decoration: decoration,
  );
}

TextStyle getRegularStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w400,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}
