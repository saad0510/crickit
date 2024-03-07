import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sizer.dart';
import 'colors.dart';
import 'fonts.dart';
import 'ui_overlays.dart';

class AppTheme {
  late final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: AppUiOverlays.lightOverlay,
    ),
    elevatedButtonTheme: elevatedButton,
    textButtonTheme: textButton,
    inputDecorationTheme: inputTheme,
    checkboxTheme: checkbox,
    cardTheme: card,
    expansionTileTheme: expansionTile,
    datePickerTheme: datePicker,
  );

  late final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    colorScheme: AppColors.darkColorScheme,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: AppUiOverlays.darkOverlay,
    ),
    elevatedButtonTheme: elevatedButton,
    textButtonTheme: textButton,
    inputDecorationTheme: inputTheme,
    checkboxTheme: checkbox,
    cardTheme: card,
    expansionTileTheme: expansionTile,
    datePickerTheme: datePicker,
  );

  ThemeData withBrightness(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final theme = isDark ? darkTheme : lightTheme;
    final textTheme = AppFonts.textTheme.merge(theme.textTheme);
    final titleTextStyle = textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500);

    return theme.copyWith(
      textTheme: textTheme,
      appBarTheme: theme.appBarTheme.copyWith(
        titleTextStyle: titleTextStyle,
        iconTheme: IconThemeData(size: 26.sp),
      ),
      listTileTheme: listTile.copyWith(
        selectedTileColor: theme.colorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
    );
  }

  final inputTheme = const InputDecorationTheme(
    filled: true,
    isDense: true,
    errorMaxLines: 3,
    helperMaxLines: 3,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      padding: AppPaddings.smallY,
      textStyle: AppFonts.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
    ),
  );

  final textButton = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: AppFonts.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w500),
    ),
  );

  final listTile = ListTileThemeData(
    contentPadding: AppPaddings.smallX,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  final card = const CardTheme(
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  final expansionTile = ExpansionTileThemeData(
    childrenPadding: AppPaddings.small,
    tilePadding: AppPaddings.smallX,
    backgroundColor: AppColors.lightColorScheme.secondaryContainer,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    collapsedShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  final datePicker = const DatePickerThemeData(
    headerBackgroundColor: AppColors.primary,
    headerForegroundColor: AppColors.onPrimary,
  );

  final checkbox = const CheckboxThemeData(shape: CircleBorder());
}

final themeModeProvider = StateProvider<Brightness>((ref) => Brightness.light);
