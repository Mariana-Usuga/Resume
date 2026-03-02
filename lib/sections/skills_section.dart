import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants/portfolio_data.dart';
import '../core/theme/app_colors.dart';
import '../models/skill.dart';
import '../widgets/common/responsive_wrapper.dart';
import '../widgets/common/section_header.dart';

/// Sección Habilidades: grid con iconos por tecnología.
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const Map<SkillCategory, String> _categoryLabels = {
    SkillCategory.frontend: 'Frontend',
    SkillCategory.backend: 'Backend',
    SkillCategory.mobile: 'Mobile',
    SkillCategory.tools: 'Herramientas',
  };

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            const SectionHeader(title: 'Habilidades')
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.2, end: 0),
            const SizedBox(height: 48),
            ...SkillCategory.values.map(
              (category) {
                final categorySkills =
                    PortfolioData.skills.where((s) => s.category == category);
                if (categorySkills.isEmpty) return const SizedBox.shrink();
                final categoryIndex = category.index;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _categoryLabels[category] ?? category.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: categorySkills
                                .toList()
                                .asMap()
                                .entries
                                .map((entry) => _SkillItem(
                                      name: entry.value.name,
                                      index: categoryIndex * 10 + entry.key,
                                    ))
                                .toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.name, required this.index});

  final String name;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getSkillIcon(name),
            size: 28,
            color: accentColor,
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: accentColor,
                  fontWeight: FontWeight.w500,
                ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(delay: (50 * index).ms, duration: 300.ms)
        .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }

  IconData _getSkillIcon(String name) {
    switch (name.toLowerCase()) {
      case 'angular':
        return Icons.architecture;
      case 'react':
        return Icons.extension;
      case 'nodejs':
      case 'node':
        return Icons.storage;
      case 'nestjs':
        return Icons.api;
      case 'java':
        return Icons.coffee;
      case 'postgresql':
      case 'postgres':
        return Icons.storage;
      case 'mongodb':
      case 'mongo':
        return Icons.sports_esports;
      case 'flutter':
        return Icons.phone_android;
      case 'git':
        return Icons.code;
      case 'scrum':
        return Icons.groups;
      case 'aws':
        return Icons.cloud;
      case 'javascript':
        return Icons.javascript;
      default:
        return Icons.code;
    }
  }
}
