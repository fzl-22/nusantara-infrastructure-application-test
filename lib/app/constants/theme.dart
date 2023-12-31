// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData THEME = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF00A9FF),
      onPrimary: Color(0xFFFAFAFA),
      secondary: Color(0xFFCDF5FD),
      onSecondary: Colors.white,
      tertiary: Color(0xFFFFB703),
      onTertiary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Color(0xFF404040),
      surface: Color(0xFF00A9FF),
      onSurface: Colors.white,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.normal,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    ),
  );
}
