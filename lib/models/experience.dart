/// Modelo para experiencia laboral.
class Experience {
  const Experience({
    required this.company,
    required this.role,
    required this.location,
    required this.period,
    required this.achievements,
  });

  final String company;
  final String role;
  final String location;
  final String period;
  final List<String> achievements;
}
