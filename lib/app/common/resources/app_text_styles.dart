import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

TextStyle getBoldStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w700,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getRegularStyle({
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w300,
  Color color = AppColors.primary,
}) {
  return GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}