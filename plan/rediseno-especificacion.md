# Especificación del Rediseño - Portafolio Mariana

Documento que consolida todas las decisiones de diseño para el rediseño del portafolio.  
**Fecha**: Marzo 2025  
**Objetivo**: Portafolio más moderno, visual y profesional aprovechando Flutter.

---

## Resumen de Decisiones

| Aspecto | Decisión |
|---------|----------|
| Hero | Centrado con foto circular sobre texto, fondo gradiente azul→cyan |
| Gradiente Hero | Azul (#0F3460) → Cyan/Turquesa (#00D9FF) |
| Cards Proyectos | Imagen superior ~40%, texto debajo, hover con elevación |
| Animaciones scroll | Fade + slide + stagger (sección + elementos internos) |
| About | Foto izquierda, texto derecha (layout split) |
| Tecnologías | Grid con iconos por tecnología |
| AppBar | Transparente sobre Hero → sólida al scroll |
| Fondos | Solo Hero con gradiente; resto plano |
| Hover | Moderado: elevación + scale 1.02-1.05 en cards |
| Experiencia | Timeline vertical |
| Contacto | Split: formulario + datos de contacto |
| Imagen proyectos | flutter.jpeg (en raíz) |

---

## Assets Requeridos

| Asset | Ubicación | Uso |
|-------|-----------|-----|
| me.jpeg | Raíz del proyecto | Foto personal - Hero y About |
| flutter.jpeg | Raíz del proyecto | Imagen para cards de proyectos (screenshot Merlin app) |

**Configuración pubspec.yaml**: Incluir ambos assets desde la raíz o mover a `assets/` y referenciar.

---

## 1. Hero Section

### Layout
- **Estructura**: Centrado vertical y horizontal
- **Orden**: Foto circular (arriba) → Nombre → Título → Tagline → Chips contacto → Scroll indicator
- **Foto**: Circular, tamaño ~180-220px desktop, ~140px mobile
- **Borde foto**: Opcional - borde blanco 3-4px o sombra sutil

### Fondo
- **Gradiente**: Linear vertical
  - Color inicio: `#0F3460` (azul oscuro)
  - Color fin: `#00D9FF` (cyan/turquesa)
  - Opcional: gradiente diagonal para más dinamismo

### Contenido
- Nombre: H1, blanco o muy claro (contraste sobre gradiente)
- Título: "Desarrolladora Full Stack" - H2, blanco con opacidad 0.9
- Tagline: texto actual
- Chips: estilo outline blanco o semi-transparente
- Scroll indicator: flecha animada (bounce sutil)

### Animación entrada
- Foto: fade in + scale 0.95→1
- Texto: fade + slide up con stagger (nombre → título → tagline → chips)

---

## 2. AppBar

### Comportamiento
- **Sobre Hero**: Fondo transparente, texto/iconos blancos
- **Al scroll**: Detectar scroll position; cuando sale del Hero → fondo sólido (blanco/gris claro en light, oscuro en dark)
- **Transición**: AnimatedContainer o similar, 200-300ms

### Implementación
- Usar ScrollController o NotificationListener para detectar scroll
- Cambiar backgroundColor y foregroundColor según posición

---

## 3. About Section

### Layout
- **Desktop**: Row con dos columnas
  - Izquierda (40%): Foto (me.jpeg) - circular o con border-radius grande
  - Derecha (60%): Contenido (Perfil, Educación, Hobbies)
- **Mobile**: Column - foto arriba centrada, texto abajo

### Foto
- Tamaño: ~300px desktop, ~200px mobile
- Forma: Circular o rounded (border-radius 16-20)
- Sombra sutil para profundidad

### Contenido
- Mantener estructura actual: Perfil, Educación, Fuera del código
- Mejorar jerarquía tipográfica

---

## 4. Sección Experiencia

### Diseño
- **Timeline vertical**: Línea vertical conectando cada experiencia
- **Cada item**: Círculo/punto en la línea + card o contenido al lado
- **Orden**: Más reciente arriba (DMS → It Team → Make It Real)

### Estilo
- Línea: vertical, color accent (azul/cyan)
- Puntos: círculos rellenos con color accent
- Cards: mismo estilo que proyectos - fondo surface, border-radius, sombra

---

## 5. Sección Tecnologías/Habilidades

### Diseño
- **Grid con iconos**: Cada tecnología = icono + nombre
- **Layout**: Grid responsive (4-5 cols desktop, 2-3 tablet, 2 mobile)
- **Categorías**: Mantener agrupación (Frontend, Backend, Mobile, Tools)

### Iconos
- Usar package `devicons` o similar para iconos de tecnologías
- Si no hay icono: usar inicial o placeholder con color
- Hover: scale sutil en cada item

---

## 6. Sección Proyectos

### Cards
- **Estructura**: 
  - Imagen superior: ~40% altura, flutter.jpeg
  - Contenido: Categoría badge, título, descripción, tech badges
- **Imagen**: ClipRRect con border-radius, aspect ratio 16:9 o similar
- **Hover**: 
  - Elevación: 2 → 6
  - Scale: 1.0 → 1.03
  - Transición: 200ms ease

### Fallback
- Si flutter.jpeg no existe: Container con color accent + icono placeholder

---

## 7. Sección Contacto

### Layout
- **Split**: Formulario (izq) | Datos contacto (der)
- **Mantener**: Campos actuales, validación, enlaces mailto/tel/LinkedIn

---

## 8. Animaciones

### Scroll-triggered
- **Secciones**: Fade in + slide up (20-30px) al entrar en viewport
- **Stagger**: Elementos internos (cards, badges) con delay 50-100ms entre cada uno
- **Implementación**: Visibilidad detector + AnimatedOpacity/Transform + TweenAnimationBuilder o package flutter_animate

### Hover (desktop)
- **Cards**: Elevación + scale 1.02-1.05
- **Botones**: Cambio opacidad o color
- **Links**: Subrayado animado o color change

### Duración
- Rápida: 150-200ms
- Media: 300ms
- Transiciones: Curves.easeInOut

---

## 9. Paleta de Colores (Azules)

### Modo Claro
| Uso | Color | Hex |
|-----|-------|-----|
| Background | Blanco/Gris muy claro | #FAFAFA |
| Surface | Blanco | #FFFFFF |
| Primary | Azul oscuro | #0F3460 |
| Accent | Cyan | #00D9FF |
| Text primary | Casi negro | #1A1A2E |
| Text secondary | Gris | #64748B |

### Modo Oscuro
| Uso | Color | Hex |
|-----|-------|-----|
| Background | Negro oscuro | #0D0D0D |
| Surface | Gris oscuro | #1A1A1A |
| Primary | Azul | #4A9EFF |
| Accent | Cyan | #00D9FF |
| Text | Blanco | #FFFFFF |
| Text secondary | Gris claro | #B0B0B0 |

### Gradiente Hero
- `#0F3460` → `#00D9FF` (o variantes para suavidad)

---

## 10. Orden de Implementación Sugerido

1. **Assets**: Configurar pubspec con me.jpeg y flutter.jpeg (ambos en raíz)
2. **Paleta**: Actualizar app_colors.dart con tonos azules
3. **Hero**: Gradiente + foto circular + contenido
4. **AppBar**: Lógica transparente → sólida
5. **About**: Layout split con foto
6. **Experiencia**: Timeline vertical
7. **Skills**: Grid con iconos
8. **Proyectos**: Cards con imagen superior + hover
9. **Animaciones**: Scroll-triggered + stagger
10. **Polish**: Ajustes finales, hover en todos los elementos

---

## Checklist Pre-Implementación

- [x] me.jpeg en raíz
- [x] flutter.jpeg en raíz
- [ ] pubspec.yaml assets configurado (incluir raíz o assets/)
- [ ] Dependencia flutter_animate (opcional, para animaciones)
- [ ] Package devicons o similar para iconos de tecnologías (opcional)

---

*Documento listo para guiar la implementación del rediseño.*
