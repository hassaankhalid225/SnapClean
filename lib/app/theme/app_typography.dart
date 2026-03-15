import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle get display => GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.w700,
        fontSize: 32,
      );

  static TextStyle get heading => GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );

  static TextStyle get subheading => GoogleFonts.playfairDisplay(
        fontWeight: FontWeight.w600,
        fontSize: 20,
      );

  static TextStyle get bodyLarge => GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        fontSize: 16,
      );

  static TextStyle get bodyMedium => GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      );

  static TextStyle get bodySmall => GoogleFonts.dmSans(
        fontWeight: FontWeight.w400,
        fontSize: 12,
      );

  static TextStyle get button => GoogleFonts.dmSans(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      );

  static TextStyle get mono => GoogleFonts.jetBrainsMono(
        fontWeight: FontWeight.w500,
        fontSize: 12,
      );
}
