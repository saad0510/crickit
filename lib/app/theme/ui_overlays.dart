import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppUiOverlays {
  static const lightOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
  );

  static const darkOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: Color(0xFF1C1B1E),
  );

  static const primaryOverlay = SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarColor: AppColors.primary,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarColor: AppColors.primary,
  );
}
