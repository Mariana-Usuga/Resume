import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants/portfolio_data.dart';
import '../core/theme/app_colors.dart';
import '../models/experience.dart';
import '../widgets/common/responsive_wrapper.dart';
import '../widgets/common/section_header.dart';

/// Sección Experiencia: timeline vertical.
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? AppColors.darkSurface : AppColors.lightSurface;
    final accentColor = isDark ? AppColors.darkPrimary : AppColors.lightPrimary;

    return Container(
      color: surfaceColor,
      child: ResponsiveWrapper(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const SectionHeader(title: 'Experiencia')
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.2, end: 0),
              const SizedBox(height: 48),
              ...PortfolioData.experiences.asMap().entries.map(
                    (entry) => _TimelineItem(
                      experience: entry.value,
                      isLast: entry.key == PortfolioData.experiences.length - 1,
                      accentColor: accentColor,
                      index: entry.key,
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  const _TimelineItem({
    required this.experience,
    required this.isLast,
    required this.accentColor,
    required this.index,
  });

  final Experience experience;
  final bool isLast;
  final Color accentColor;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Línea y punto
        SizedBox(
          width: 32,
          child: Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accentColor,
                  border: Border.all(
                    color: isDark ? AppColors.darkSurface : Colors.white,
                    width: 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: accentColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Container(
                  width: 2,
                  height: 24,
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  color: accentColor.withValues(alpha: 0.4),
                ),
            ],
          ),
        ),
        const SizedBox(width: 24),
        // Card - sin Expanded para que tome su altura natural
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: _ExperienceCard(
              experience: experience,
              secondaryColor: secondaryColor,
            )
                .animate()
                .fadeIn(delay: (100 * index).ms, duration: 400.ms)
                .slideX(begin: 0.1, end: 0, curve: Curves.easeOut),
          ),
        ),
      ],
    );
  }
}

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.experience,
    required this.secondaryColor,
  });

  final Experience experience;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        experience.company,
                        style: Theme.of(context).textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        experience.role,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      experience.period,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: secondaryColor,
                          ),
                      textAlign: TextAlign.end,
                    ),
                    Text(
                      experience.location,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: secondaryColor,
                          ),
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...experience.achievements.map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        '• ',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: secondaryColor,
                            ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        a,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: secondaryColor,
                              height: 1.5,
                            ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
