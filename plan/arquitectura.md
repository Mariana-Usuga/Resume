# Arquitectura Técnica - Portafolio Flutter

## Stack Tecnológico

| Tecnología | Versión | Uso |
|------------|---------|-----|
| Flutter | 3.x | Framework principal |
| Dart | 3.x | Lenguaje |
| Provider | ^6.x | State management |
| Flutter Web | - | Plataforma objetivo |

---

## Estructura de Carpetas Recomendada

```
lib/
├── main.dart                 # Entry point, MaterialApp, providers
├── app.dart                  # Configuración de tema, rutas
│
├── core/                     # Código compartido
│   ├── constants/            # Strings, valores fijos
│   │   ├── app_constants.dart
│   │   └── portfolio_data.dart   # Datos de mariana.txt estructurados
│   ├── theme/
│   │   ├── app_theme.dart    # Tema claro y oscuro
│   │   └── app_colors.dart
│   └── utils/
│       └── scroll_utils.dart # Helpers para scroll
│
├── providers/
│   └── theme_provider.dart   # Provider para modo oscuro/claro
│
├── widgets/                  # Widgets reutilizables
│   ├── common/
│   │   ├── section_header.dart
│   │   ├── animated_section.dart
│   │   └── responsive_wrapper.dart
│   └── layout/
│       ├── app_bar_custom.dart
│       └── footer.dart
│
├── sections/                 # Cada sección de la landing page
│   ├── hero_section.dart
│   ├── about_section.dart
│   ├── experience_section.dart
│   ├── skills_section.dart
│   ├── projects_section.dart
│   └── contact_section.dart
│
└── models/                   # Modelos de datos (opcional)
    ├── experience.dart
    ├── project.dart
    └── skill.dart
```

---

## Flujo de la Aplicación

```
main.dart
    └── MultiProvider (ThemeProvider)
        └── MaterialApp
            └── HomePage (Scaffold)
                └── SingleChildScrollView / CustomScrollView
                    ├── HeroSection
                    ├── AboutSection
                    ├── ExperienceSection
                    ├── SkillsSection
                    ├── ProjectsSection
                    └── ContactSection
```

---

## State Management con Provider

### ThemeProvider

**Responsabilidad**: Gestionar el modo oscuro/claro y persistirlo.

```dart
// providers/theme_provider.dart
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  
  void toggleTheme() { ... }
  // Persistir con shared_preferences o similar para web
}
```

**Registro en main.dart**:
```dart
ChangeNotifierProvider(create: (_) => ThemeProvider())
```

### Uso en la UI

```dart
// Para leer el tema
final themeProvider = context.watch<ThemeProvider>();

// Para cambiar el tema
context.read<ThemeProvider>().toggleTheme();
```

---

## Navegación y Scroll

### Enfoque: Single Page con Scroll Sections

- **No usar Navigator** para navegación entre secciones
- Usar **ScrollController** con `scrollTo` para navegación programática
- Cada sección tiene un **GlobalKey** o **Scrollable.ensureVisible** para scroll suave
- El AppBar puede tener botones que hagan scroll a cada sección

### Implementación sugerida

```dart
// En HomePage
final ScrollController _scrollController = ScrollController();
final Map<String, GlobalKey> _sectionKeys = {
  'hero': GlobalKey(),
  'about': GlobalKey(),
  'experience': GlobalKey(),
  'skills': GlobalKey(),
  'projects': GlobalKey(),
  'contact': GlobalKey(),
};

void _scrollToSection(String sectionId) {
  final context = _sectionKeys[sectionId]!.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(context, duration: Duration(milliseconds: 500));
  }
}
```

---

## Responsive Design

### Breakpoints recomendados

| Breakpoint | Ancho | Uso |
|------------|-------|-----|
| mobile | < 600px | Layout vertical, menú hamburguesa |
| tablet | 600 - 1024px | Layout adaptativo |
| desktop | > 1024px | Layout completo, dos columnas |

### Implementación

```dart
// Usar MediaQuery o LayoutBuilder
final width = MediaQuery.of(context).size.width;
final isMobile = width < 600;
final isTablet = width >= 600 && width < 1024;
final isDesktop = width >= 1024;
```

O crear un widget `ResponsiveBuilder` que reciba builders para cada breakpoint.

---

## Datos del Portafolio

### Ubicación centralizada

Todos los datos de `mariana.txt` deben estar en **`lib/core/constants/portfolio_data.dart`** como constantes o datos estáticos. Esto facilita:
- Mantener una única fuente de verdad
- Actualizar información sin tocar la UI
- Reutilizar datos en múltiples secciones

### Estructura de datos sugerida

```dart
// models/experience.dart
class Experience {
  final String company;
  final String role;
  final String location;
  final String period;
  final List<String> achievements;
}

// models/project.dart  
class Project {
  final String name;
  final String description;
  final List<String> technologies;
  final String? demoUrl;
  final String? repoUrl;
  final ProjectCategory category; // web, mobile, backend, fullstack
}

// models/skill.dart
class Skill {
  final String name;
  final SkillCategory category; // frontend, backend, mobile, tools
}
```

---

## Dependencias pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  # Para persistir tema (opcional en web):
  # shared_preferences: ^2.2.2
  # Para formulario de contacto (opcional):
  # url_launcher: ^6.2.2
  # Para validación:
  # No necesario, usar Form y TextFormField nativos
```

---

## Configuración para Web

### index.html
- Asegurar meta viewport para responsive
- Título: "Mariana Usuga | Desarrolladora Full Stack"
- Meta description para SEO

### web/manifest.json
- Configurar PWA básica si se desea
- Iconos del portafolio

---

## Buenas Prácticas para Implementación

1. **Un widget por archivo** para secciones y componentes reutilizables
2. **Extraer constantes** de strings y números mágicos
3. **Usar const** donde sea posible para optimización
4. **Evitar rebuilds innecesarios** con `const` constructors y `RepaintBoundary` en secciones
5. **Lazy loading**: Las secciones pueden usar `Visibility` o similar para no renderizar contenido fuera de viewport (optimización avanzada)
6. **Accesibilidad**: Semantics en widgets interactivos, contraste adecuado

---

## Orden de Creación de Archivos

1. `main.dart` - Setup básico
2. `core/theme/` - Temas y colores
3. `providers/theme_provider.dart`
4. `core/constants/portfolio_data.dart` - Datos
5. `widgets/common/responsive_wrapper.dart`
6. Secciones en orden: Hero → About → Experience → Skills → Projects → Contact
7. Integración en HomePage con scroll
8. AppBar con navegación
9. Formulario de contacto
10. Polish y animaciones
