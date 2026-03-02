# Especificación de Features - Portafolio Mariana

Cada feature está documentada para implementación independiente. Incluye criterios de aceptación, datos requeridos y estructura de widgets.

---

## Feature 1: Setup Inicial del Proyecto

### Objetivo
Crear el proyecto Flutter configurado para web con estructura base y dependencias.

### Tareas
1. `flutter create .` (o crear proyecto en carpeta)
2. Habilitar web: `flutter config --enable-web`
3. Crear estructura de carpetas según `arquitectura.md`
4. Agregar dependencias: `provider`
5. Configurar `pubspec.yaml` con nombre del proyecto
6. Configurar `web/index.html` con título y meta tags

### Criterios de aceptación
- [ ] Proyecto corre con `flutter run -d chrome`
- [ ] Estructura de carpetas existe
- [ ] Provider está en dependencias
- [ ] Título de la página es "Mariana Usuga | Desarrolladora Full Stack"

### Archivos a crear
- `lib/main.dart` (básico)
- Estructura vacía de `core/`, `providers/`, `widgets/`, `sections/`

---

## Feature 2: Sistema de Tema (Claro/Oscuro)

### Objetivo
Implementar ThemeProvider y temas claro/oscuro según `sistema-diseno.md`.

### Tareas
1. Crear `lib/core/theme/app_colors.dart` con paleta completa
2. Crear `lib/core/theme/app_theme.dart` con ThemeData light y dark
3. Crear `lib/providers/theme_provider.dart`
4. Registrar ThemeProvider en main.dart
5. Configurar MaterialApp con `theme` y `darkTheme`
6. (Opcional) Persistir preferencia con shared_preferences

### Criterios de aceptación
- [ ] La app muestra tema claro por defecto
- [ ] Existe forma de alternar a tema oscuro (botón temporal para testing)
- [ ] Colores aplicados según sistema de diseño
- [ ] Tipografía configurada (Google Fonts si se usa)

### Datos
Usar colores definidos en `sistema-diseno.md`.

### Widgets
- `ThemeProvider` con `isDarkMode` y `toggleTheme()`
- `MaterialApp(theme: ..., darkTheme: ..., themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light)`

---

## Feature 3: Datos del Portafolio (portfolio_data.dart)

### Objetivo
Centralizar todos los datos de `mariana.txt` en constantes estructuradas.

### Tareas
1. Crear `lib/core/constants/portfolio_data.dart`
2. Crear modelos si se desea: `Experience`, `Project`, `Skill`
3. Poblar con datos exactos del CV

### Estructura de datos requerida

```dart
// Información personal
static const String fullName = 'Mariana Usuga Montoya';
static const String location = 'Medellín, Colombia';
static const String email = 'musugamontoya@gmail.com';
static const String phone = '+57 317-701-98-62';
static const String linkedInUrl = ''; // Agregar cuando se tenga

// Resumen (texto del CV)
static const String summary = 'Desarrolladora Full Stack con...';

// Hobbies
static const List<String> hobbies = ['Volleyball', 'Senderismo', 'Danza'];

// Experiencia (lista de objetos)
// DMS Software, It Team Corp, Make It Real

// Educación
// ITM, Desarrollo de Software, 2020 - In progress

// Habilidades por categoría
// Frontend: Angular, React
// Backend: NodeJs, NestJs, Java, PostgreSQL, MongoDB
// Mobile: Flutter
// Tools: Git, Scrum, AWS, JavaScript

// Proyectos por categoría
// Web: MarktPul, Escuela de danza
// Mobile: App pedidos bodega
// Full-Stack: Propuestas comerciales, UI DynamoDB/S3
```

### Criterios de aceptación
- [ ] Todos los datos de mariana.txt están representados
- [ ] Datos son fácilmente importables en widgets
- [ ] Sin datos hardcodeados en la UI

---

## Feature 4: Layout Base y Scroll

### Objetivo
Crear la página principal con scroll suave y estructura para todas las secciones.

### Tareas
1. Crear `lib/sections/` con widgets placeholder para cada sección
2. Crear HomePage con SingleChildScrollView o CustomScrollView
3. Implementar ScrollController y keys para cada sección
4. Crear AppBar con navegación que haga scroll a secciones
5. Crear widget ResponsiveWrapper o usar MediaQuery para max-width

### Estructura HomePage

```dart
Scaffold(
  appBar: AppBarCustom(
    onSectionTap: _scrollToSection,
    sectionIds: ['about', 'experience', 'skills', 'projects', 'contact'],
  ),
  body: SingleChildScrollView(
    controller: _scrollController,
    child: Column(
      children: [
        HeroSection(key: _sectionKeys['hero']),
        AboutSection(key: _sectionKeys['about']),
        ExperienceSection(key: _sectionKeys['experience']),
        SkillsSection(key: _sectionKeys['skills']),
        ProjectsSection(key: _sectionKeys['projects']),
        ContactSection(key: _sectionKeys['contact']),
      ],
    ),
  ),
)
```

### Criterios de aceptación
- [ ] Scroll fluido entre secciones
- [ ] AppBar permite navegar a cada sección
- [ ] Contenedor con max-width 1200px centrado
- [ ] Padding vertical entre secciones (80px desktop, 48px mobile)

---

## Feature 5: Hero Section

### Objetivo
Sección de bienvenida impactante con nombre, título y CTA.

### Contenido
- **Nombre**: Mariana Usuga Montoya (H1)
- **Título**: Desarrolladora Full Stack (H2 o subtítulo)
- **Tagline**: Una línea del resumen o frase personalizada
- **CTA**: Botón o indicador de scroll "Conoce más" o flecha hacia abajo

### Diseño
- Altura: 100vh o 80vh (viewport height)
- Contenido centrado vertical y horizontalmente
- Animación de entrada: fade in + slide up del texto
- Scroll indicator animado en la parte inferior

### Criterios de aceptación
- [ ] Nombre y título visibles y destacados
- [ ] Responsive: texto se adapta en mobile
- [ ] Animación sutil al cargar
- [ ] Scroll indicator funcional o decorativo

### Widgets
- `HeroSection` con Column centrada
- Usar datos de `portfolio_data.dart`

---

## Feature 6: About Section (Sobre Mí)

### Objetivo
Dos columnas: lado técnico (carrera, educación) y lado personal (hobbies).

### Contenido - Columna Izquierda (Técnico)
- Resumen profesional (texto del CV)
- Educación: ITM, Desarrollo de Software, 2020 - In progress
- Bullets de lo aprendido (Java, matemáticas, estadísticas)

### Contenido - Columna Derecha (Personal)
- Título: "Fuera del código"
- Hobbies: Volleyball, Senderismo, Danza
- Descripción breve opcional de cada uno
- (Opcional) Espacio para foto de perfil

### Diseño
- Desktop: Dos columnas 50/50 o 60/40
- Mobile: Stack vertical, técnico primero
- Section header: "Sobre Mí"
- Cards o contenedores con padding para cada columna

### Criterios de aceptación
- [ ] Ambas columnas visibles en desktop
- [ ] Layout vertical en mobile
- [ ] Hobbies claramente presentados
- [ ] Resumen profesional completo

---

## Feature 7: Experience Section

### Objetivo
Timeline cronológica de experiencia laboral.

### Contenido (de mariana.txt)

| Empresa | Rol | Período | Logros |
|---------|-----|---------|--------|
| DMS Software | Desarrolladora Frontend | Oct 2023 - Abr 2025 | Flutter app pedidos bodega, escaneo códigos de barras |
| It Team Corp | Desarrolladora Full Stack | Jun 2022 - May 2023 | App propuestas comerciales (Angular, Java, PostgreSQL), UI DynamoDB/S3 |
| Make It Real | Desarrolladora Full Stack | Ago 2021 - Ene 2022 | MarktPul (e-commerce), App escuela danza |

### Diseño
- Timeline vertical con línea conectora
- Cada item: empresa (bold), rol, período, lista de logros
- Cards con hover effect
- Orden: más reciente primero

### Criterios de aceptación
- [ ] Las 3 experiencias mostradas
- [ ] Logros como bullets
- [ ] Diseño timeline o cards alternados
- [ ] Responsive

---

## Feature 8: Skills Section

### Objetivo
Grid de habilidades organizado por categorías.

### Categorías y habilidades

| Categoría | Skills |
|-----------|--------|
| Frontend | Angular, React |
| Backend | NodeJs, NestJs, Java, PostgreSQL, MongoDB |
| Mobile | Flutter |
| Tools | Git, Scrum, AWS, JavaScript |

### Diseño
- Section header: "Habilidades"
- Grid por categoría: cada categoría tiene un título y sus badges
- Badges: estilo pill, icono opcional, nombre de tecnología
- Hover: ligero cambio de color o elevación
- Responsive: 2-4 columnas en desktop, 1-2 en mobile

### Criterios de aceptación
- [ ] Todas las habilidades del CV incluidas
- [ ] Organizadas por categoría
- [ ] Badges con estilo consistente
- [ ] Iconos opcionales (devicons o similar)

### Implementación
- Usar `portfolio_data.dart` con estructura `Map<SkillCategory, List<String>>`
- Widget `SkillBadge` reutilizable
- Widget `SkillCategory` que recibe título y lista

---

## Feature 9: Projects Section

### Objetivo
Proyectos categorizados por tipo con cards interactivos.

### Proyectos por categoría

**Web**
- **MarktPul**: Plataforma compra/venta segunda mano. Tech: Redux, Tailwind, NodeJs, Express, MongoDB, JWT, Epayco
- **Escuela de danza**: Gestión cursos, inscripción, pagos. Perfiles director/estudiantes

**Mobile**
- **App pedidos bodega**: Asignaciones, productos, escaneo códigos de barras, inventario. Tech: Flutter

**Full-Stack**
- **Propuestas comerciales**: Organizar propuestas, documentar proyectos. Tech: Angular, Java, PostgreSQL
- **UI DynamoDB/S3**: Acceso DynamoDB, archivos S3, presentación resultados. Tech: JavaScript

### Diseño
- Filtros por categoría (tabs o chips): Todas, Web, Mobile, Full-Stack
- Cards con: nombre, descripción breve, tecnologías (badges), enlaces (si existen)
- Hover: elevación, transición suave
- Grid responsive: 1 col mobile, 2 cols tablet, 2-3 cols desktop

### Criterios de aceptación
- [ ] Todos los proyectos del CV incluidos
- [ ] Categorización visible
- [ ] Tecnologías mostradas en cada card
- [ ] Filtro por categoría funcional
- [ ] Enlaces a demo/repo si se tienen (opcional)

---

## Feature 10: Contact Section

### Objetivo
Formulario de contacto con validación + enlaces directos.

### Contenido
- **Formulario**: Nombre, Email, Mensaje (mínimo 3 campos)
- **Validación**: Email válido, mensaje no vacío, longitud mínima
- **Enlaces**: Email (mailto:), Teléfono (tel:), LinkedIn
- **Botón**: "Enviar mensaje" (submit)

### Diseño
- Section header: "Contacto"
- Formulario a la izquierda o arriba
- Información de contacto a la derecha o abajo
- Botones/links con iconos
- Estados: normal, focus, error (validación)

### Comportamiento del formulario
- **Fase 1**: Validación en frontend, mostrar mensaje de éxito simulado
- **Fase 2 (futuro)**: Integrar con servicio (Formspree, EmailJS, backend propio)

### Criterios de aceptación
- [ ] Formulario con 3+ campos
- [ ] Validación en tiempo real
- [ ] Mensaje de error visible en campos inválidos
- [ ] Enlaces mailto, tel, LinkedIn funcionales
- [ ] Botón enviar con estado loading/disabled durante submit

### Datos de contacto
- Email: musugamontoya@gmail.com
- Teléfono: +57 317-701-98-62
- LinkedIn: (agregar URL)

---

## Feature 11: AppBar y Navegación

### Objetivo
AppBar fija con navegación a secciones y toggle de tema.

### Elementos
- **Logo/Nombre**: "Mariana" o inicial "M"
- **Links**: Sobre Mí, Experiencia, Habilidades, Proyectos, Contacto
- **Toggle tema**: Icono sol/luna
- **Mobile**: Menú hamburguesa que expande a drawer o dropdown

### Comportamiento
- Al hacer click en link: scroll suave a la sección
- AppBar puede cambiar estilo al hacer scroll (opcional: transparente en hero, sólida después)
- Toggle tema: cambia ThemeProvider

### Criterios de aceptación
- [ ] Navegación funcional a todas las secciones
- [ ] Toggle tema visible y funcional
- [ ] Responsive: menú colapsado en mobile
- [ ] Scroll suave al hacer click

---

## Feature 12: Animaciones y Polish

### Objetivo
Agregar animaciones sutiles y refinamientos finales.

### Animaciones a implementar
1. **Entrada de secciones**: Fade in + slide up al hacer scroll (IntersectionObserver o similar en Flutter)
2. **Hover en cards**: Elevación, transición 200ms
3. **Hover en botones**: Cambio de opacidad o color
4. **Scroll indicator en Hero**: Animación bounce o pulse
5. **Stagger en grids**: Entrada secuencial de items con delay

### Herramientas Flutter
- `AnimatedOpacity`, `AnimatedContainer`
- `TweenAnimationBuilder`
- `Visibility` con `AnimatedSwitcher`
- Package `flutter_animate` (opcional) para animaciones declarativas

### Criterios de aceptación
- [ ] Animaciones no bloquean ni ralentizan
- [ ] Transiciones suaves (150-400ms)
- [ ] Hover effects en elementos interactivos
- [ ] Entrada de secciones perceptible al scroll

---

## Feature 13: Footer (Opcional)

### Objetivo
Footer minimalista con copyright y links.

### Contenido
- "© 2025 Mariana Usuga"
- Links: LinkedIn, Email (iconos)
- Volver arriba (opcional)

### Diseño
- Fondo surface, texto secondary
- Centrado, padding vertical 24px

---

## Resumen de Dependencias entre Features

```
1 (Setup) 
  → 2 (Tema)
  → 3 (Datos)
  → 4 (Layout)
  → 5 (Hero)
  → 6 (About)
  → 7 (Experience)
  → 8 (Skills)
  → 9 (Projects)
  → 10 (Contact)
  → 11 (AppBar) - puede hacerse junto con 4
  → 12 (Animaciones) - al final
  → 13 (Footer) - opcional
```

Features 5-10 pueden desarrollarse en paralelo una vez 4 está listo, ya que son secciones independientes.
