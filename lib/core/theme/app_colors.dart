import 'package:flutter/material.dart';

/// Paleta de colores del portafolio - tonos azules modernos.
/// Referencia: plan/rediseno-especificacion.md
class AppColors {
  AppColors._();

  // Gradiente Hero
  static const Color heroGradientStart = Color(0xFF0F3460);
  static const Color heroGradientEnd = Color(0xFF00D9FF);

  // Modo Claro
  static const Color lightBackground = Color(0xFFFAFAFA);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightPrimary = Color(0xFF0F3460);
  static const Color lightAccent = Color(0xFF00D9FF);
  static const Color lightTextPrimary = Color(0xFF1A1A2E);
  static const Color lightTextSecondary = Color(0xFF64748B);
  static const Color lightBorder = Color(0xFFE0E0E0);

  // Modo Oscuro
  static const Color darkBackground = Color(0xFF0D0D0D);
  static const Color darkSurface = Color(0xFF1A1A1A);
  static const Color darkPrimary = Color(0xFF4A9EFF);
  static const Color darkAccent = Color(0xFF00D9FF);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);
  static const Color darkBorder = Color(0xFF2D2D2D);

  // Aliases para compatibilidad
  static const Color lightSecondary = lightTextSecondary;
  static const Color darkSecondary = darkTextSecondary;
  static const Color lightAccentHighlight = lightAccent;
  static const Color darkAccentHighlight = darkAccent;
}
