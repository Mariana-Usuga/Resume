/// Categorías de habilidades técnicas.
enum SkillCategory {
  frontend,
  backend,
  mobile,
  tools,
}

/// Modelo para habilidades.
class Skill {
  const Skill({
    required this.name,
    required this.category,
  });

  final String name;
  final SkillCategory category;
}
