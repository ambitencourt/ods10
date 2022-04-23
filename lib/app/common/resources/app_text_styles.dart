import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextStyle getRegularStyleW400({
  double fontSize = 18,
  FontWeight fontWeight = FontWeight.w400,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w500,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyleW600({
  double fontSize = 12,
  FontWeight fontWeight = FontWeight.w600,
  Color color = AppColors.white,
}) {
  return GoogleFonts.mulish(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    height: 1.15,
  );
}

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
