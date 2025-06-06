import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moviestar/src/core/theme/colors.dart';

class Style {
  static SystemUiOverlayStyle get systemUiOverlay => const SystemUiOverlayStyle(
    statusBarColor: colorPrimary,
    systemNavigationBarColor: colorPrimary,
    systemNavigationBarDividerColor: colorPrimary,
  );

  static ThemeData get material3Theme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.dark(
        primary: colorPrimary,
        onPrimary: colorLabelOnPrimary,
        secondary: colorSecondary,
        surface: colorBackground,
      ),
    );
  }
}
