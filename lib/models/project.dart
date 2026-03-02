/// Categorías de proyectos.
enum ProjectCategory {
  web,
  mobile,
  fullstack,
}

/// Modelo para proyectos del portafolio.
class Project {
  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    required this.category,
    this.demoUrl,
    this.repoUrl,
  });

  final String name;
  final String description;
  final List<String> technologies;
  final ProjectCategory category;
  final String? demoUrl;
  final String? repoUrl;
}
