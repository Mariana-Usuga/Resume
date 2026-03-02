# Sistema de Diseño - Portafolio Mariana

## Filosofía de Diseño

**Minimalista y profesional**. Líneas limpias, tipografía moderna, colores neutros con acentos tecnológicos sutiles. El contenido es el protagonista; el diseño lo presenta sin competir.

---

## Paleta de Colores

### Modo Claro

| Nombre | Hex | Uso |
|--------|-----|-----|
| Background | `#FAFAFA` | Fondo principal |
| Surface | `#FFFFFF` | Cards, secciones alternadas |
| Primary | `#1A1A2E` | Texto principal, acentos |
| Secondary | `#16213E` | Texto secundario |
| Accent | `#0F3460` | Botones, links, highlights |
| Accent Light | `#E94560` | Hover, CTAs, detalles |
| Border | `#E0E0E0` | Divisores, bordes |

### Modo Oscuro

| Nombre | Hex | Uso |
|--------|-----|-----|
| Background | `#0D0D0D` | Fondo principal |
| Surface | `#1A1A1A` | Cards, secciones |
| Primary | `#FFFFFF` | Texto principal |
| Secondary | `#B0B0B0` | Texto secundario |
| Accent | `#4A9EFF` | Botones, links |
| Accent Light | `#E94560` | Hover, CTAs |
| Border | `#2D2D2D` | Divisores |

### Variables en código

```dart
// core/theme/app_colors.dart
class AppColors {
  // Light
  static const lightBackground = Color(0xFFFAFAFA);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightPrimary = Color(0xFF1A1A2E);
  static const lightSecondary = Color(0xFF16213E);
  static const lightAccent = Color(0xFF0F3460);
  static const lightAccentHighlight = Color(0xFFE94560);
  
  // Dark
  static const darkBackground = Color(0xFF0D0D0D);
  static const darkSurface = Color(0xFF1A1A1A);
  // ... etc
}
```

---

## Tipografía

### Fuentes recomendadas

**Opción A (Google Fonts)**:
- **Títulos**: `Poppins` (600-700) - Moderna, geométrica
- **Cuerpo**: `Inter` (400) - Legible, neutral
- **Mono (código/tech)**: `JetBrains Mono` o `Fira Code` - Para badges de tecnologías

**Opción B (más minimalista)**:
- **Todo**: `Inter` - Consistencia total

### Escala tipográfica

| Estilo | Tamaño | Weight | Uso |
|--------|--------|--------|-----|
| H1 | 48-56px | 700 | Hero nombre |
| H2 | 36-40px | 600 | Títulos de sección |
| H3 | 24-28px | 600 | Subtítulos |
| Body Large | 18px | 400 | Párrafos destacados |
| Body | 16px | 400 | Texto normal |
| Body Small | 14px | 400 | Metadatos, captions |
| Caption | 12px | 400 | Labels, badges |

### Responsive tipography

```dart
// En mobile, reducir H1 a 32-40px
// En mobile, H2 a 28-32px
```

---

## Espaciado

### Sistema de 8px

Usar múltiplos de 8 para consistencia: 8, 16, 24, 32, 40, 48, 64, 80, 96

| Token | Valor | Uso |
|-------|-------|-----|
| xs | 8px | Entre elementos muy cercanos |
| sm | 16px | Padding interno de cards |
| md | 24px | Entre elementos relacionados |
| lg | 32px | Entre bloques |
| xl | 48px | Entre secciones |
| xxl | 64-80px | Separación de secciones principales |

### Padding de secciones

- **Vertical**: 80-120px en desktop, 48-64px en mobile
- **Horizontal**: Max 1200px centrado, padding lateral 24-48px

---

## Componentes Reutilizables

### Section Header

```
[Línea decorativa opcional]  TÍTULO DE SECCIÓN
                             Subtítulo opcional
```

- Título: H2, color primary
- Subtítulo: Body, color secondary
- Alineación: Centrado o izquierda según sección

### Card (Proyectos, Experiencia)

- Border radius: 8-12px
- Sombra sutil: elevation 2 en light, 4 en dark
- Padding: 24px
- Hover: elevation +2, transición 200ms

### Botón Primario

- Background: Accent
- Text: Blanco
- Padding: 12px 24px
- Border radius: 8px
- Hover: Opacidad 0.9 o color más claro

### Botón Secundario (Outline)

- Border: 2px Accent
- Background: Transparente
- Text: Accent
- Hover: Background Accent con opacidad baja

### Input (Formulario)

- Border: 1px solid Border color
- Border radius: 8px
- Padding: 12px 16px
- Focus: Border Accent, outline none

### Badge (Tecnologías)

- Background: Accent con 10% opacidad
- Text: Accent
- Padding: 6px 12px
- Border radius: 20px (pill)
- Font: Small, 12-14px

---

## Iconos

- **Fuente**: Material Icons (incluido en Flutter) o Lucide/Feather si se agrega paquete
- **Tamaño estándar**: 24px
- **Tamaño pequeño**: 20px (en badges, listas)
- **Hover**: Cambiar color a Accent

---

## Animaciones

### Duración estándar

- **Rápida**: 150-200ms (hover, micro-interacciones)
- **Media**: 300-400ms (transiciones de sección)
- **Lenta**: 500-600ms (entrada de elementos)

### Tipos de animación

1. **Fade in**: Opacidad 0 → 1
2. **Slide up**: TranslateY 20 → 0
3. **Scale**: Scale 0.95 → 1 (sutil)
4. **Stagger**: Entrada secuencial con delay 50-100ms entre elementos

### Implementación Flutter

```dart
// AnimatedOpacity, AnimatedContainer
// O TweenAnimationBuilder para más control
// O package: flutter_animate para animaciones declarativas
```

---

## Breakpoints y Layout

| Breakpoint | Width | Columnas | Comportamiento |
|------------|-------|----------|----------------|
| Mobile | < 600 | 1 | Stack vertical, menú hamburguesa |
| Tablet | 600-1024 | 2 | Grid 2 cols donde aplique |
| Desktop | > 1024 | 2-3 | Layout completo, max-width 1200px |

### Contenedor principal

```dart
// Max width 1200px, centrado, padding horizontal 24-48px
ConstrainedBox(
  constraints: BoxConstraints(maxWidth: 1200),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 24),
    child: content,
  ),
)
```

---

## Accesibilidad

- **Contraste**: Mínimo 4.5:1 para texto normal, 3:1 para texto grande
- **Focus**: Indicadores visibles en elementos interactivos
- **Touch targets**: Mínimo 44x44px en mobile
- **Semantics**: Usar Semantics widget para screen readers

---

## Assets Necesarios

| Asset | Especificaciones | Uso |
|-------|------------------|-----|
| Foto perfil | 400x400px min, formato cuadrado | Sección About |
| Favicon | 32x32, 192x192 | Browser |
| Logo/Inicial | SVG preferible | Opcional en header |

---

## Resumen Ejecutivo para Implementación

1. Crear `lib/core/theme/app_theme.dart` con ThemeData para light y dark
2. Crear `lib/core/theme/app_colors.dart` con la paleta
3. Configurar Google Fonts en pubspec.yaml
4. Crear widgets base: SectionHeader, PortfolioCard, PrimaryButton
5. Aplicar espaciado consistente con EdgeInsets usando múltiplos de 8
6. Usar MediaQuery para responsive en cada sección
