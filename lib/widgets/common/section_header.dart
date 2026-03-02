import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

/// Header reutilizable para secciones del portafolio.
/// Título H2 + subtítulo opcional.
class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.centerAlign = true,
  });

  final String title;
  final String? subtitle;
  final bool centerAlign;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final secondaryColor =
        isDark ? AppColors.darkSecondary : AppColors.lightSecondary;

    return Column(
      crossAxisAlignment:
          centerAlign ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                color: primaryColor,
                fontSize: _responsiveTitleSize(context),
              ),
          textAlign: centerAlign ? TextAlign.center : TextAlign.left,
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: secondaryColor,
                ),
            textAlign: centerAlign ? TextAlign.center : TextAlign.left,
          ),
        ],
      ],
    );
  }

  double _responsiveTitleSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < 600) return 28;
    if (width < 1024) return 32;
    return 36;
  }
}
