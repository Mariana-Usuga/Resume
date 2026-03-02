import '../../models/experience.dart';
import '../../models/project.dart';
import '../../models/skill.dart';

/// Datos del portafolio. Fuente única: mariana.txt
/// Actualizar aquí cuando cambie la información del CV.
class PortfolioData {
  PortfolioData._();

  // --- Información personal ---
  static const String fullName = 'Mariana Usuga Montoya';
  static const String location = 'Medellín, Colombia';
  static const String email = 'musugamontoya@gmail.com';
  static const String phone = '+57 317-701-98-62';
  static const String linkedInUrl = 'https://www.linkedin.com/in/mariana-usuga';

  // --- Resumen profesional ---
  static const String summary =
      'Desarrolladora Full Stack con una sólida experiencia en Angular, ReactJs, '
      'PostgreSQL, MongoDB, Java y Node.js. He trabajado en el desarrollo de aplicaciones '
      'web para comercio electrónico y gestión de procesos, enfocados en soluciones escalables '
      'y de alto rendimiento. Además, tengo experiencia en Flutter, utilizando Bloc, Provider e '
      'inyección de dependencias, lo que me permite gestionar el estado y mantener una arquitectura '
      'limpia y eficiente en las aplicaciones móviles.';

  // --- Hobbies e intereses ---
  static const List<String> hobbies = ['Volleyball', 'Senderismo', 'Danza'];

  // --- Educación ---
  static const String educationInstitution = 'Instituto Tecnológico Metropolitano';
  static const String educationDegree = 'Desarrollo de Software';
  static const String educationLocation = 'Medellín, Colombia';
  static const String educationPeriod = '2020 - En curso';
  static const List<String> educationHighlights = [
    'Adquirí conocimientos en Java para la programación orientada a objetos, obteniendo una base sólida en los principios de programación.',
    'Amplié mi comprensión de matemáticas, estadísticas y cálculo para un conjunto de habilidades técnicas más completo.',
  ];

  // --- Experiencia laboral ---
  static const List<Experience> experiences = [
    Experience(
      company: 'DMS Software',
      role: 'Desarrolladora Frontend',
      location: 'Medellín, Colombia',
      period: 'Octubre 2023 - Abril 2025',
      achievements: [
        'Trabajé con Flutter para desarrollar una aplicación de pedidos para una bodega.',
        'La aplicación permite al bodeguero ver sus asignaciones y productos disponibles, mejorando la gestión y el control de inventario con escaneo de productos mediante código de barras, agilizando el proceso de registro y actualización de inventarios.',
        'Me aseguré de que la aplicación sea intuitiva y fácil de usar, proporcionando una experiencia de usuario optimizada.',
      ],
    ),
    Experience(
      company: 'It Team Corp',
      role: 'Desarrolladora Full Stack',
      location: 'Medellín, Colombia',
      period: 'Junio 2022 - Mayo 2023',
      achievements: [
        'Desarrollé una aplicación web estática para organizar propuestas comerciales y documentar proyectos completados, utilizando Angular, Java (para API REST) y PostgreSQL.',
        'Diseñé una interfaz de usuario web en JavaScript para acceder y almacenar datos en DynamoDB, gestionar archivos en S3 y presentar resultados de manera intuitiva.',
      ],
    ),
    Experience(
      company: 'Make It Real',
      role: 'Desarrolladora Full Stack',
      location: 'Medellín, Colombia',
      period: 'Agosto 2021 - Enero 2022',
      achievements: [
        'Contribuí al desarrollo de MarktPul, una plataforma web para la compra y venta de productos de segunda mano, utilizando Redux, Tailwind CSS, NodeJs, Express, MongoDB, JWT, Epayco y Bcrypt.',
        'Creé una aplicación web para la gestión de procesos de una escuela de danza con perfiles distintos para director y estudiantes, facilitando la creación de cursos, inscripción y pagos.',
      ],
    ),
  ];

  // --- Habilidades por categoría ---
  static const List<Skill> skills = [
    Skill(name: 'Angular', category: SkillCategory.frontend),
    Skill(name: 'React', category: SkillCategory.frontend),
    Skill(name: 'NodeJs', category: SkillCategory.backend),
    Skill(name: 'NestJs', category: SkillCategory.backend),
    Skill(name: 'Java', category: SkillCategory.backend),
    Skill(name: 'PostgreSQL', category: SkillCategory.backend),
    Skill(name: 'MongoDB', category: SkillCategory.backend),
    Skill(name: 'Flutter', category: SkillCategory.mobile),
    Skill(name: 'Git', category: SkillCategory.tools),
    Skill(name: 'Scrum', category: SkillCategory.tools),
    Skill(name: 'AWS', category: SkillCategory.tools),
    Skill(name: 'JavaScript', category: SkillCategory.tools),
  ];

  // --- Proyectos por categoría ---
  static const List<Project> projects = [
    Project(
      name: 'MarktPul',
      description:
          'Plataforma web para la compra y venta de productos de segunda mano.',
      technologies: [
        'Redux',
        'Tailwind CSS',
        'NodeJs',
        'Express',
        'MongoDB',
        'JWT',
        'Epayco',
        'Bcrypt',
      ],
      category: ProjectCategory.web,
    ),
    Project(
      name: 'Escuela de Danza',
      description:
          'Aplicación web para la gestión de procesos con perfiles para director y estudiantes: creación de cursos, inscripción y pagos.',
      technologies: ['JavaScript', 'NodeJs', 'MongoDB'],
      category: ProjectCategory.web,
    ),
    Project(
      name: 'App Pedidos Bodega',
      description:
          'Aplicación móvil Flutter para gestión de pedidos e inventario con escaneo de códigos de barras. Asignaciones y productos disponibles para bodegueros.',
      technologies: ['Flutter', 'Bloc', 'Provider'],
      category: ProjectCategory.mobile,
    ),
    Project(
      name: 'Propuestas Comerciales',
      description:
          'Aplicación web para organizar propuestas comerciales y documentar proyectos completados.',
      technologies: ['Angular', 'Java', 'PostgreSQL'],
      category: ProjectCategory.fullstack,
    ),
    Project(
      name: 'UI DynamoDB/S3',
      description:
          'Interfaz web para acceder y almacenar datos en DynamoDB, gestionar archivos en S3 y presentar resultados.',
      technologies: ['JavaScript', 'AWS', 'DynamoDB', 'S3'],
      category: ProjectCategory.fullstack,
    ),
  ];
}
