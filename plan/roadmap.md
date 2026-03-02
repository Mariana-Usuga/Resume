# Roadmap de Implementación - Portafolio Mariana

Este documento define el orden exacto para implementar el portafolio paso a paso. Cada fase es independiente y puede validarse antes de continuar.

---

## Fase 0: Pre-requisitos

- [ ] Flutter SDK instalado (3.x)
- [ ] IDE configurado (VS Code, Android Studio)
- [ ] Chrome para testing web
- [ ] Archivo `mariana.txt` en la raíz del proyecto (fuente de datos)

---

## Fase 1: Fundamentos (Día 1)

### Paso 1.1: Crear proyecto Flutter
```bash
flutter create portfolio_mariana
cd portfolio_mariana
flutter config --enable-web
```

O si ya existe carpeta:
```bash
cd c:\Users\usuga\Downloads\Resume
flutter create . --project-name portfolio_mariana
```

### Paso 1.2: Estructura de carpetas
Crear según `arquitectura.md`:
```
lib/
├── main.dart
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
├── providers/
├── widgets/
│   ├── common/
│   └── layout/
├── sections/
└── models/
```

### Paso 1.3: Dependencias
En `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.1.1
  google_fonts: ^6.1.0  # Opcional para tipografía
```

### Paso 1.4: Verificación
```bash
flutter pub get
flutter run -d chrome
```
**Checkpoint**: App Flutter básica corre en Chrome.

---

## Fase 2: Sistema de Diseño (Día 1-2)

### Paso 2.1: Colores y tema
- Crear `lib/core/theme/app_colors.dart`
- Crear `lib/core/theme/app_theme.dart`
- Implementar ThemeData para light y dark según `sistema-diseno.md`

### Paso 2.2: ThemeProvider
- Crear `lib/providers/theme_provider.dart`
- Registrar en `main.dart` con `MultiProvider`
- Configurar `MaterialApp` con `theme`, `darkTheme`, `themeMode`

### Paso 2.3: Integración
- Crear botón temporal para toggle tema
- Verificar que ambos temas se aplican correctamente

**Checkpoint**: La app alterna entre tema claro y oscuro.

---

## Fase 3: Datos del Portafolio (Día 2)

### Paso 3.1: Portfolio data
- Crear `lib/core/constants/portfolio_data.dart`
- Copiar y estructurar TODOS los datos de `mariana.txt`
- Crear modelos si se desea: `Experience`, `Project`, `Skill`

### Paso 3.2: Validación
- Revisar que no falte ningún dato del CV
- Verificar formato de fechas, listas, textos

**Checkpoint**: Archivo `portfolio_data.dart` completo y sin errores de sintaxis.

---

## Fase 4: Layout Base (Día 2-3)

### Paso 4.1: HomePage con scroll
- Crear `HomePage` con `SingleChildScrollView`
- Crear placeholders para cada sección (Container con altura mínima y texto)
- Implementar `ScrollController` y `GlobalKey` para cada sección
- Función `_scrollToSection()` con `Scrollable.ensureVisible`

### Paso 4.2: Contenedor responsive
- Crear `ResponsiveWrapper` o widget con `ConstrainedBox(maxWidth: 1200)`
- Aplicar padding horizontal según breakpoint
- Envolver contenido de cada sección

### Paso 4.3: AppBar básica
- Crear `AppBarCustom` con nombre "Mariana"
- Botones/links que llamen a `_scrollToSection`
- Toggle de tema usando `ThemeProvider`
- (Mobile: implementar Drawer o menú colapsable)

**Checkpoint**: Navegación por secciones funciona, scroll suave, tema toggle.

---

## Fase 5: Secciones de Contenido (Días 3-5)

Implementar en este orden. Cada sección puede probarse independientemente.

### Paso 5.1: Hero Section
- Widget `HeroSection`
- Nombre (H1), título (H2), tagline
- Scroll indicator
- Animación fade in al cargar
- **Checkpoint**: Hero visible y responsive

### Paso 5.2: About Section
- Widget `AboutSection`
- Section header "Sobre Mí"
- Dos columnas: técnico (resumen, educación) | personal (hobbies)
- Layout responsive: columnas en desktop, stack en mobile
- **Checkpoint**: Contenido completo, layout correcto

### Paso 5.3: Experience Section
- Widget `ExperienceSection`
- Timeline o cards con DMS, It Team Corp, Make It Real
- Datos de `portfolio_data.dart`
- **Checkpoint**: 3 experiencias mostradas correctamente

### Paso 5.4: Skills Section
- Widget `SkillsSection`
- Grid por categorías (Frontend, Backend, Mobile, Tools)
- Widget `SkillBadge` reutilizable
- **Checkpoint**: Todas las habilidades visibles por categoría

### Paso 5.5: Projects Section
- Widget `ProjectsSection`
- Cards por proyecto con categoría
- Filtros por categoría (Web, Mobile, Full-Stack)
- **Checkpoint**: Proyectos categorizados, filtro funcional

### Paso 5.6: Contact Section
- Widget `ContactSection`
- Formulario: nombre, email, mensaje
- Validación con `Form`, `TextFormField`, `validator`
- Enlaces: mailto, tel, LinkedIn
- Botón enviar (por ahora: mostrar snackbar de éxito)
- **Checkpoint**: Formulario valida, enlaces funcionan

---

## Fase 6: Widgets Reutilizables (Durante Fase 5)

Crear según se necesiten:

- `SectionHeader`: Título + subtítulo opcional
- `PortfolioCard`: Card base con estilo consistente
- `PrimaryButton` / `SecondaryButton`
- `SkillBadge`
- `ResponsiveWrapper`

---

## Fase 7: Animaciones y Polish (Día 6)

### Paso 7.1: Animaciones de entrada
- Fade in + slide up en secciones al hacer scroll
- Usar `Visibility` + `AnimatedOpacity` o package `flutter_animate`
- Stagger en grids (skills, projects)

### Paso 7.2: Hover effects
- Cards: elevación al hover
- Botones: cambio de opacidad
- Badges: ligero scale o color change

### Paso 7.3: Transiciones
- Duración consistente (200-400ms)
- Curvas: `Curves.easeInOut`

**Checkpoint**: Animaciones sutiles, sin lag, experiencia fluida.

---

## Fase 8: Footer y Detalles Finales (Día 6-7)

### Paso 8.1: Footer
- Copyright "© 2025 Mariana Usuga"
- Iconos LinkedIn, Email

### Paso 8.2: SEO y meta
- `web/index.html`: título, description, viewport
- Favicon
- Open Graph tags (opcional)

### Paso 8.3: Testing
- Probar en diferentes viewports (mobile, tablet, desktop)
- Probar tema claro y oscuro
- Probar formulario de contacto
- Probar todos los links de navegación
- Verificar que no hay overflow o layout roto

---

## Fase 9: Deploy (Post-desarrollo)

### Opciones de deploy para Flutter Web
1. **Netlify**: `flutter build web` → deploy carpeta `build/web`
2. **Vercel**: Similar
3. **Firebase Hosting**: `firebase deploy`
4. **GitHub Pages**: Con GitHub Actions

### Comandos
```bash
flutter build web --release
# Subir contenido de build/web al hosting
```

---

## Resumen de Tiempo Estimado

| Fase | Duración estimada |
|------|-------------------|
| 1. Fundamentos | 1-2 horas |
| 2. Sistema de diseño | 2-3 horas |
| 3. Datos | 1 hora |
| 4. Layout base | 2-3 horas |
| 5. Secciones | 6-8 horas |
| 6. Widgets | (incluido en 5) |
| 7. Animaciones | 2-3 horas |
| 8. Finales | 1-2 horas |
| **Total** | **~15-22 horas** |

---

## Cómo Usar Este Roadmap

1. **Para IA/desarrollador**: Seguir los pasos en orden. Cada "Checkpoint" indica cuándo pasar al siguiente paso.
2. **Para debugging**: Si algo falla, verificar que la fase anterior pasó su checkpoint.
3. **Para priorizar**: Fases 1-5 son críticas. Fase 7 puede simplificarse si hay restricciones de tiempo.
4. **Para continuar**: Si se abandona el proyecto, anotar en qué paso se quedó para retomar.

---

## Comandos de Referencia Rápida

```bash
# Crear proyecto
flutter create . --project-name portfolio_mariana

# Ejecutar en Chrome
flutter run -d chrome

# Build para producción
flutter build web --release

# Limpiar
flutter clean && flutter pub get

# Analizar código
flutter analyze
```
