import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/experience_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/layout/app_bar_custom.dart';

/// Página principal con scroll sections.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledPastHero = false;

  final Map<String, GlobalKey> _sectionKeys = {
    'hero': GlobalKey(),
    'about': GlobalKey(),
    'experience': GlobalKey(),
    'skills': GlobalKey(),
    'projects': GlobalKey(),
    'contact': GlobalKey(),
  };

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final heroContext = _sectionKeys['hero']?.currentContext;
    if (heroContext == null) return;

    final heroBox = heroContext.findRenderObject() as RenderBox?;
    if (heroBox == null) return;

    final heroHeight = heroBox.size.height;
    final scrollOffset = _scrollController.offset;
    final shouldBeTransparent = scrollOffset < heroHeight * 0.5;

    if (_isScrolledPastHero != !shouldBeTransparent) {
      setState(() => _isScrolledPastHero = !shouldBeTransparent);
    }
  }

  void _scrollToSection(String sectionId) {
    final context = _sectionKeys[sectionId]?.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        onSectionTap: _scrollToSection,
        isTransparent: !_isScrolledPastHero,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _SectionWrapper(key: _sectionKeys['hero'], child: const HeroSection()),
            _SectionWrapper(
                key: _sectionKeys['about'], child: const AboutSection()),
            _SectionWrapper(
                key: _sectionKeys['experience'],
                child: const ExperienceSection()),
            _SectionWrapper(
                key: _sectionKeys['skills'], child: const SkillsSection()),
            _SectionWrapper(
                key: _sectionKeys['projects'], child: const ProjectsSection()),
            _SectionWrapper(
                key: _sectionKeys['contact'], child: const ContactSection()),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

class _SectionWrapper extends StatelessWidget {
  const _SectionWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Text(
        '© 2025 Mariana Usuga',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isDark ? Colors.grey : Colors.grey[600],
            ),
      ),
    );
  }
}
