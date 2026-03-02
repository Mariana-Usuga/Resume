import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../core/constants/portfolio_data.dart';
import '../core/theme/app_colors.dart';
import '../widgets/common/responsive_wrapper.dart';
import '../widgets/common/section_header.dart';

/// Sección Sobre Mí: foto izquierda, texto derecha (layout split).
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final secondaryColor =
        isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    final photoSize = isMobile ? 200.0 : 300.0;

    return ResponsiveWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: Column(
          children: [
            const SectionHeader(title: 'Sobre Mí')
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
            const SizedBox(height: 48),
            if (isMobile)
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildPhoto(photoSize)
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms)
                      .scale(begin: const Offset(0.95, 0.95)),
                  const SizedBox(height: 32),
                  _TechnicalColumn(secondaryColor: secondaryColor)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms)
                      .slideY(begin: 0.15, end: 0),
                  const SizedBox(height: 32),
                  _PersonalColumn(secondaryColor: secondaryColor)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 400.ms)
                      .slideY(begin: 0.15, end: 0),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: _buildPhoto(photoSize)
                        .animate()
                        .fadeIn(delay: 100.ms, duration: 400.ms)
                        .slideX(begin: -0.1, end: 0, curve: Curves.easeOut),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _TechnicalColumn(secondaryColor: secondaryColor)
                            .animate()
                            .fadeIn(delay: 200.ms, duration: 400.ms)
                            .slideX(begin: 0.1, end: 0, curve: Curves.easeOut),
                        const SizedBox(height: 32),
                        _PersonalColumn(secondaryColor: secondaryColor)
                            .animate()
                            .fadeIn(delay: 300.ms, duration: 400.ms)
                            .slideX(begin: 0.1, end: 0, curve: Curves.easeOut),
                      ],
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoto(double size) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            'me.jpeg',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: AppColors.lightAccent.withValues(alpha: 0.2),
              child: Icon(Icons.person, size: size * 0.5),
            ),
          ),
        ),
      ),
    );
  }
}

class _TechnicalColumn extends StatelessWidget {
  const _TechnicalColumn({required this.secondaryColor});

  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Perfil',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          PortfolioData.summary,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: secondaryColor,
                height: 1.6,
              ),
        ),
        const SizedBox(height: 24),
        Text(
          'Educación',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 8),
        Text(
          '${PortfolioData.educationInstitution} • ${PortfolioData.educationLocation}',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: secondaryColor,
              ),
        ),
        Text(
          '${PortfolioData.educationDegree} • ${PortfolioData.educationPeriod}',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: secondaryColor,
              ),
        ),
        const SizedBox(height: 8),
        ...PortfolioData.educationHighlights.map(
          (h) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: secondaryColor,
                      ),
                ),
                Expanded(
                  child: Text(
                    h,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: secondaryColor,
                          height: 1.5,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PersonalColumn extends StatelessWidget {
  const _PersonalColumn({required this.secondaryColor});

  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fuera del código',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          'Cuando no estoy desarrollando, disfruto de:',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: secondaryColor,
              ),
        ),
        const SizedBox(height: 16),
        ...PortfolioData.hobbies.map(
          (hobby) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                Icon(
                  _getHobbyIcon(hobby),
                  size: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 12),
                Text(
                  hobby,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: secondaryColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  IconData _getHobbyIcon(String hobby) {
    switch (hobby.toLowerCase()) {
      case 'volleyball':
        return Icons.sports_volleyball;
      case 'senderismo':
        return Icons.directions_walk;
      case 'danza':
        return Icons.music_note;
      default:
        return Icons.favorite;
    }
  }
}
