import 'package:flutter/material.dart';

ThemeData apolloThemeData = ThemeData(
    primarySwatch: const MaterialColor(0xFF007F9E, const {
      50: const Color(0xFFE2F6FF),
      100: const Color(0xFFB6E8FD),
      200: const Color(0xFF86D9FA),
      300: const Color(0xFF57CAF4),
      400: const Color(0xFF37C0EE),
      500: const Color(0xFF2BB5E7),
      600: const Color(0xFF23A6D3),
      700: const Color(0xFF1292B7),
      800: const Color(0xFF007F9E),
      900: const Color(0xFF005C71),
    }),
    colorScheme: ColorScheme(
      primary: const Color(0xFF007F9E),
      primaryVariant: const Color(0xFF005C71),
      secondary: const Color(0xFFFFB300),
      secondaryVariant: const Color(0xFFFFA000),
      surface: const Color(0xFFFFFFFF),
      background: const Color(0xFFFFFFFF),
      error: const Color(0xFFB00020),
      onPrimary: const Color(0xFFFFFFFF),
      onSecondary: const Color(0xFF000000),
      onSurface: const Color(0xFF000000),
      onBackground: const Color(0xFF000000),
      onError: const Color(0xFFFFFFFF),
      brightness: Brightness.light,
    ));
