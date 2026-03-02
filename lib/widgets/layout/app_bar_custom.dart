import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/theme/app_colors.dart';
import '../../providers/theme_provider.dart';

/// AppBar personalizada: transparente sobre Hero, sólida al scroll.
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom({
    super.key,
    required this.onSectionTap,
    this.isTransparent = false,
    this.sectionIds = const [
      'about',
      'experience',
      'skills',
      'projects',
      'contact',
    ],
  });

  final void Function(String sectionId) onSectionTap;
  final bool isTransparent;
  final List<String> sectionIds;

  static const Map<String, String> _sectionLabels = {
    'about': 'Sobre Mí',
    'experience': 'Experiencia',
    'skills': 'Habilidades',
    'projects': 'Proyectos',
    'contact': 'Contacto',
  };

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    final backgroundColor = isTransparent
        ? Colors.transparent
        : (isDark ? AppColors.darkBackground : AppColors.lightBackground);
    final foregroundColor = isTransparent
        ? Colors.white
        : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary);

    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      title: Text(
          'Mariana',
          style: TextStyle(
            color: foregroundColor,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        iconTheme: IconThemeData(color: foregroundColor),
        actions: [
          if (isMobile)
            _buildMobileMenu(context, foregroundColor)
          else
            ..._buildDesktopNav(context, foregroundColor),
          IconButton(
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: foregroundColor,
            ),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
            tooltip: 'Cambiar tema',
          ),
        ],
    );
  }

  List<Widget> _buildDesktopNav(BuildContext context, Color foregroundColor) {
    return sectionIds
        .map(
          (id) => TextButton(
            onPressed: () => onSectionTap(id),
            child: Text(
              _sectionLabels[id] ?? id,
              style: TextStyle(color: foregroundColor, fontSize: 14),
            ),
          ),
        )
        .toList();
  }

  Widget _buildMobileMenu(BuildContext context, Color foregroundColor) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: foregroundColor),
      onSelected: (id) => onSectionTap(id),
      itemBuilder: (context) => sectionIds
          .map(
            (id) => PopupMenuItem(
              value: id,
              child: Text(_sectionLabels[id] ?? id),
            ),
          )
          .toList(),
    );
  }
}
