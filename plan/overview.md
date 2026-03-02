# Portafolio Web Flutter - Mariana Usuga

## Resumen del Proyecto

Portafolio web personal construido con **Flutter para Web**, diseñado para presentar de manera profesional la experiencia, habilidades, proyectos e intereses personales de Mariana Usuga Montoya.

**Fuente de datos única**: Toda la información del portafolio proviene exclusivamente del archivo `mariana.txt` en la raíz del proyecto. No se debe tomar en cuenta ningún portafolio existente.

---

## Objetivos del Proyecto

1. **Presentar profesionalmente** a Mariana como desarrolladora Full Stack
2. **Mostrar claramente** qué construye (proyectos por categoría)
3. **Revelar personalidad** a través de hobbies e intereses
4. **Facilitar contacto** mediante formulario funcional y enlaces directos
5. **Demostrar expertise técnico** en Flutter mediante el propio portafolio

---

## Perfil del Usuario (Mariana)

| Campo | Valor |
|-------|-------|
| **Nombre** | Mariana Usuga Montoya |
| **Ubicación** | Medellín, Colombia |
| **Email** | musugamontoya@gmail.com |
| **Teléfono** | +57 317-701-98-62 |
| **LinkedIn** | (enlace a incluir) |

### Resumen Profesional
Desarrolladora Full Stack con experiencia en Angular, ReactJs, PostgreSQL, MongoDB, Java y Node.js. Experiencia en aplicaciones web para comercio electrónico y gestión de procesos. Conocimientos en Flutter (Bloc, Provider, inyección de dependencias) para aplicaciones móviles escalables.

### Hobbies e Intereses
- Volleyball
- Senderismo
- Danza

---

## Decisiones de Diseño Clave

| Aspecto | Decisión |
|---------|----------|
| **Estilo visual** | Minimalista y profesional |
| **Navegación** | Landing page con scroll sections |
| **Funcionalidades** | Animaciones sutiles, hover effects, modo oscuro/claro |
| **Proyectos** | Categorizados por tipo (Web, Móvil, Backend, Full-Stack) |
| **Habilidades** | Grid por categorías (Frontend, Backend, Mobile, Tools) |
| **Sobre Mí** | Dos columnas: técnico vs personal |
| **Contacto** | Formulario + enlaces directos |
| **State management** | Provider |
| **Arquitectura** | Modular por secciones |

---

## Alcance del Proyecto

### Incluido
- Portafolio web responsive (desktop, tablet, móvil)
- 6 secciones principales con scroll suave
- Modo oscuro/claro persistente
- Formulario de contacto con validación
- Animaciones sutiles de entrada/salida
- Diseño minimalista y profesional

### No incluido (en esta fase)
- Backend para formulario de contacto (se puede integrar después)
- Blog o CMS
- Autenticación de usuarios
- Multi-idioma

---

## Estructura de Documentación

```
plan/
├── overview.md          ← Este archivo
├── arquitectura.md      ← Estructura técnica Flutter
├── sistema-diseno.md    ← Colores, tipografía, componentes
├── features.md          ← Especificación detallada de cada feature
└── roadmap.md           ← Orden de implementación paso a paso
```

---

## Cómo Usar Esta Documentación

1. **Para comenzar**: Leer `overview.md` (este archivo) y `arquitectura.md`
2. **Para implementar UI**: Consultar `sistema-diseno.md` y `features.md`
3. **Para seguir el orden**: Ejecutar tareas según `roadmap.md`
4. **Para cada feature**: Buscar la sección correspondiente en `features.md`

---

## Referencias

- **Datos fuente**: `mariana.txt` (raíz del proyecto)
- **Framework**: Flutter 3.x
- **Plataforma objetivo**: Web (primary), potencialmente móvil en futuro
