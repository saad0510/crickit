import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF5800CF);
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

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6E32E5),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFE9DDFF),
    onPrimaryContainer: Color(0xFF23005C),
    secondary: Color(0xFF6850A4),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFE9DDFF),
    onSecondaryContainer: Color(0xFF23005C),
    tertiary: Color(0xFF7E525F),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFFFD9E2),
    onTertiaryContainer: Color(0xFF31101D),
    error: Color(0xFFBA1A1A),
    errorContainer: Color(0xFFFFDAD6),
    onError: Color(0xFFFFFFFF),
    onErrorContainer: Color(0xFF410002),
    background: Color(0xFFFFFBFF),
    onBackground: Color(0xFF1C1B1E),
    surface: Color(0xFFFFFBFF),
    onSurface: Color(0xFF1C1B1E),
    surfaceVariant: Color(0xFFE7E0EB),
    onSurfaceVariant: Color(0xFF49454E),
    outline: Color(0xFF7A757F),
    onInverseSurface: Color(0xFFF5EFF4),
    inverseSurface: Color(0xFF323033),
    inversePrimary: Color(0xFFD0BCFF),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFF6E32E5),
    outlineVariant: Color(0xFFCAC4CF),
    scrim: Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD0BCFF),
    onPrimary: Color(0xFF3B0091),
    primaryContainer: Color(0xFF5600CA),
    onPrimaryContainer: Color(0xFFE9DDFF),
    secondary: Color(0xFFD0BCFF),
    onSecondary: Color(0xFF381E72),
    secondaryContainer: Color(0xFF4F378A),
    onSecondaryContainer: Color(0xFFE9DDFF),
    tertiary: Color(0xFFEFB8C7),
    onTertiary: Color(0xFF4A2531),
    tertiaryContainer: Color(0xFF633B48),
    onTertiaryContainer: Color(0xFFFFD9E2),
    error: Color(0xFFFFB4AB),
    errorContainer: Color(0xFF93000A),
    onError: Color(0xFF690005),
    onErrorContainer: Color(0xFFFFDAD6),
    background: Color(0xFF1C1B1E),
    onBackground: Color(0xFFE6E1E6),
    surface: Color(0xFF1C1B1E),
    onSurface: Color(0xFFE6E1E6),
    surfaceVariant: Color(0xFF49454E),
    onSurfaceVariant: Color(0xFFCAC4CF),
    outline: Color(0xFF948F99),
    onInverseSurface: Color(0xFF1C1B1E),
    inverseSurface: Color(0xFFE6E1E6),
    inversePrimary: Color(0xFF6E32E5),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFD0BCFF),
    outlineVariant: Color(0xFF49454E),
    scrim: Color(0xFF000000),
  );
}
