import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFFE61F26);
  static const onPrimary = Color(0xFFFFFFFF);

  static const shadowGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [
      Colors.black87,
      Colors.black54,
      Colors.transparent,
    ],
  );

  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFE61F26),
    brightness: Brightness.light,
  );
  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: const Color(0xFFE61F26),
    brightness: Brightness.dark,
  );
}
