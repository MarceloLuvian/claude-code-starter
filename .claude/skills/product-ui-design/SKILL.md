---
name: product-ui-design
description: Diseña interfaces de producto (web apps, dashboards, landings, formularios, flujos) que se ven profesionales y modernas, no templated. Conocimiento de sistema de design tokens, color, tipografía, layout, componentes, estados, responsive, accesibilidad y micro-interacciones. Úsala ANTES de implementar UI para fijar el sistema visual y evitar resultados genéricos. La invoca el agente `designer`.
user-invocable: true
---

# product-ui-design

Diseña UI de **producto** de nivel profesional: limpia, jerárquica, con sistema de tokens consistente y pulido en los detalles. El objetivo no es decorar — es que la interfaz se entienda sola, se vea confiable y no parezca una plantilla. Trabaja **token-first**: define el sistema antes de tocar pantallas.

## Proceso (en orden, no te saltes pasos)

1. **Contexto:** ¿qué producto es, quién lo usa, qué tono transmite (confiable / cálido / técnico / premium)? Define 1 frase de "personalidad visual" antes de elegir colores.
2. **Tokens:** define el sistema (color, tipografía, espaciado, radios, elevación, motion). Ver abajo. Cárgalos en un solo lugar (ej. `tailwind.config`/`:root`), nunca valores sueltos.
3. **Wireframe por pantalla:** estructura y jerarquía en texto/ASCII antes del detalle. Un foco por pantalla.
4. **Componentes:** define los reutilizables con sus variantes y **todos sus estados**.
5. **Estados de cada vista:** vacío, carga, error, éxito — no solo el estado feliz.
6. **Pulido:** micro-interacciones, transiciones, hover/focus, loading entre vistas.
7. **Check final:** corre el checklist anti-slop de abajo antes de entregar.

## 1. Design tokens (la base de todo)

Define estos grupos como variables reutilizables. Un cambio de marca = cambiar tokens, no pantallas.

### Color — por ROL, no por nombre
No uses "azul1/azul2". Usa roles semánticos (modelo tipo Material 3):
- **primary** (acción principal) + **on-primary** (texto encima) + **primary-container** (variante suave) .
- **secondary** / **tertiary** (acentos de apoyo).
- **surface** (fondos: base, container, container-high para elevación por color) + **on-surface** (texto).
- **outline** (bordes, divisores).
- **semánticos:** success, warning, error/danger + sus `on-*` y `*-container`.
Reglas:
- Una sola familia primaria manda. Los acentos se usan con moderación (≤20% del área).
- Superficies casi neutras (tintadas levísimamente del primario), no blanco puro plano: da profundidad sin sombras pesadas.
- **Contraste AA obligatorio:** texto normal ≥4.5:1, texto grande/iconos ≥3:1. Verifícalo, no lo asumas.

### Tipografía — una familia fuerte + escala
- Elige **una** familia sans de alta calidad (ej. Inter, Geist, IBM Plex Sans) para todo el texto; suma una display/mono solo si aporta. Cárgala bien (Google Fonts con `preconnect`, `display=swap`).
- Define una **escala** con line-height y weight por nivel, p.ej.:
  - display 48/56 · 700 · headline-lg 32/40 · 600 · headline-md 24/32 · 600
  - headline-sm 20/28 · 600 · body-lg 18/28 · body-md 16/24 · label 14 · 600 · label-sm 12 · 500
- Jerarquía con tamaño + peso + color, no con muchas familias. Máximo 2 familias.

### Espaciado, radios, elevación, motion
- **Espaciado** en escala (4/8/12/16/24/40/64). Nada de números mágicos sueltos. El aire es parte del diseño.
- **Radios** consistentes (ej. sm .25rem, lg .5rem, xl .75rem, full). Elige un lenguaje (suave/redondeado o recto) y mantenlo.
- **Elevación:** prefiere superficies por color (container-low/high) y sombras **suaves y de una sola dirección**; nunca sombras genéricas duras en todo. 1–2 niveles bastan.
- **Motion:** transiciones 150–250ms `ease-out` para hover/cambios; nada salta sin transición.

## 2. Layout y jerarquía

- **Un foco por pantalla.** Lo más importante es lo más grande/contrastado; el ojo debe saber dónde aterrizar en <1s.
- Rejilla y alineación estrictas: todo se alinea a una grilla; bordes y baselines coinciden.
- **Aire generoso**: el espacio en blanco comunica calidad; no llenes cada hueco.
- Ancho de lectura cómodo (texto ≤ ~70ch). Contenedores con `max-width` centrado en desktop.

## 3. Componentes (define variantes + estados)

Para cada componente reutilizable, define: variantes, tamaños y **estados** (default, hover, focus-visible, active, disabled, loading).
- **Botón:** primary / secondary / ghost / danger; con icono opcional; estado loading con spinner; `disabled` claramente atenuado. Target ≥44px.
- **Input/Select:** label visible, placeholder de ejemplo real, foco con anillo de color, estado error con mensaje, `font-size ≥16px` en móvil (evita zoom iOS).
- **Card:** superficie elevada, padding consistente, no bordes + sombra fuerte a la vez.
- **Nav:** activo claramente marcado; en móvil bottom-nav con iconos + label.
- **Badge/Chip, Modal/Sheet, Tabla:** en móvil las tablas se vuelven lista de cards.

## 4. Estados obligatorios (lo que separa "demo" de "producto")

Nunca entregues solo el estado feliz:
- **Vacío:** ilustración/icono + 1 frase + acción para salir del vacío.
- **Carga:** **skeletons** que imitan el layout final (mejor que spinner para contenido); spinner solo para acciones puntuales. Para cambios de pantalla/datos, muestra un loading breve — la espera con feedback se siente más rápida que un salto en seco.
- **Error:** mensaje claro en lenguaje humano + cómo reintentar; color semántico de error.
- **Éxito:** confirmación visible (check + mensaje), idealmente en contexto, no solo un toast que se va.

## 5. Responsive y accesibilidad

- **Mobile-first.** Diseña la columna única primero; expande a desktop. Breakpoint típico ~768px.
- Targets táctiles ≥44px; nada importante pegado a los bordes; respeta safe-areas (notch).
- **Accesible por defecto:** jerarquía semántica de headings, `focus-visible` siempre visible, navegable por teclado, contraste AA, `prefers-reduced-motion` respetado.

## 6. Micro-interacciones y pulido

Lo que hace que "se sienta bien": hover/press con transición suave, foco con anillo, loading entre vistas, entradas con fade/translate sutil, feedback inmediato a cada acción. Sutil > llamativo: 1–2 detalles con intención valen más que muchos efectos.

## 7. Anti-slop — por qué la mayoría de UIs se ven "de plantilla" (evítalo)

- ❌ Valores sueltos en vez de tokens → inconsistencia. ✅ Todo sale del sistema.
- ❌ Sombras duras genéricas en todo / glassmorphism gratis / gradientes al azar. ✅ Superficies por color + 1–2 sombras suaves con intención.
- ❌ Blanco puro plano + gris medio para todo. ✅ Superficies tintadas + jerarquía de color.
- ❌ Texto sin jerarquía (todo del mismo tamaño/peso). ✅ Escala tipográfica clara.
- ❌ Sin estados (solo el feliz). ✅ vacío/carga/error/éxito.
- ❌ Centrar todo "por si acaso". ✅ alineación a grilla, foco intencional.
- ❌ Muchas fuentes/colores compitiendo. ✅ 1 familia + 1 primario que manda.

## 8. Stack recomendado (cuando aplique)

React + Vite + TypeScript + **Tailwind con los tokens en `tailwind.config`** (colores por rol, escala tipográfica, radios, spacing). Fuentes vía Google Fonts. Iconos de un set coherente (ej. Material Symbols, Lucide). Los tokens en config hacen que toda la app cambie desde un lugar.

## 9. Checklist pre-entrega (no entregues sin esto)

- [ ] ¿Hay UN foco claro por pantalla, legible en <1s?
- [ ] ¿Todo sale de tokens (color por rol, escala tipográfica, spacing en escala)?
- [ ] ¿Contraste AA verificado en texto y controles?
- [ ] ¿Cada vista tiene estados vacío / carga / error / éxito?
- [ ] ¿Hover/focus/disabled definidos? ¿`focus-visible` se ve?
- [ ] ¿Responsive real (móvil una columna, targets ≥44px, inputs 16px)?
- [ ] ¿Transiciones suaves y loading entre vistas?
- [ ] ¿Pasó el anti-slop (sin sombras genéricas, sin glass gratis, fuentes/colores acotados)?
- [ ] ¿Se ve como producto real, no como plantilla?

Trabaja siempre el sistema antes que las pantallas, y revisa contra este checklist antes de cerrar.
