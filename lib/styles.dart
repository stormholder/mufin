import 'package:flutter/material.dart';

class MuFinTheme {
      static const ColorScheme light = ColorScheme.light(
          primary: Color(0xFF00687C),
          primaryVariant: Color(0xFFABEDFF),
          secondary: Color(0xFF974713),
          secondaryVariant: Color(0xFFFFDBC8),
          // surface: Color(0xFFDBE4E7),
          surface: Color(0xFFFBFDF8),
          // background: Color(0xFFFBFDF8),
          background: Color(0xFFDBE4E7),
          error: Color(0xFFBA1B1B),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Color(0xFF3F484B),
          onBackground: Color(0xFF191C1A),
          onError: Color(0xFFBA1B1B)
      );

      static const ColorScheme dark = ColorScheme.dark(
          primary: Color(0xFF56D6F5),
          primaryVariant: Color(0xFF004E5E),
          secondary: Color(0xFFFFB68D),
          secondaryVariant: Color(0xFF783100),
          surface: Color(0xFF191C1A),
          background: Color(0xFF191C1A),
          error: Color(0xFFFFB4A9),
          onPrimary: Color(0xFF003642),
          onSecondary: Color(0xFF552100),
          onSurface: Color(0xFFE1E3DE),
          onBackground: Color(0xFFE1E3DE),
          onError: Color(0xFF680003)
      );

      MuFinTheme();
}