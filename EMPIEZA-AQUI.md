# Empieza aquí — guía paso a paso

Esta guía te lleva de la mano desde que clonas el proyecto hasta que el equipo de agentes construye algo para ti.
Está pensada para que la sigas aunque sea tu primera vez con Claude Code. (Para el detalle de qué hace cada archivo,
ve el `README.md`.)

---

## Antes de empezar (lo que necesitas)

1. **Claude Code instalado.** Es la herramienta de línea de comandos de Anthropic. Si no la tienes, instálala
   siguiendo la documentación oficial de Claude Code y confirma que el comando `claude` funcione en tu terminal.
2. **Una terminal** (PowerShell en Windows, Terminal en Mac/Linux).
3. **Git** (opcional). Si no usas git, puedes descargar el proyecto como ZIP y descomprimirlo.

---

## Paso 1 — Consigue el proyecto

**Opción A (con git):**
```bash
git clone <url-del-repositorio>
cd claude-code-starter
```

**Opción B (sin git):** descarga el ZIP desde la página del repositorio, descomprímelo y entra a la carpeta
`claude-code-starter`.

---

## Paso 2 — Ábrelo con Claude Code

Dentro de la carpeta del proyecto, ejecuta:
```bash
claude
```
Eso inicia Claude Code **dentro de este proyecto**. No tienes que configurar nada más para empezar.

---

## Paso 3 — Deja que lea las reglas (automático)

Apenas abres el proyecto, Claude **lee solo el archivo `CLAUDE.md`**: ahí están las reglas del proyecto y, sobre
todo, **cómo coordina al equipo de agentes**. No tienes que pedírselo; ya lo sabe.

> En pocas palabras: cuando le pidas construir algo, Claude no se pone a programar a ciegas — primero entiende qué
> quieres y luego reparte el trabajo entre los agentes especializados.

---

## Paso 4 — Pídele tu primera cosa (y deja que te pregunte)

Escríbele en lenguaje normal lo que quieres lograr. Por ejemplo:

> *"Quiero que el sistema permita que los usuarios se registren con su correo."*

Lo que va a pasar:
1. El agente **`pm-status`** te va a **entrevistar en lenguaje natural** — sin tecnicismos — para entender bien
   qué necesitas. Te hará preguntas como *"¿con contraseña o con un enlace que les llega al correo?"*,
   *"¿qué pasa si el correo ya existe?"*. **Responde con tus palabras**; si no sabes algo, te sugiere lo más común.
2. Con eso claro, el equipo construye en orden: **architect** (cómo se arma) → **designer** (cómo se ve) →
   **planner** (lista de tareas) → **dev-backend** y **dev-frontend** (lo construyen) → **code-reviewer** (revisa) →
   **qa-engineer** (prueba).
3. En los puntos importantes, Claude **te confirma antes de seguir**, para no construir algo equivocado.

No necesitas saber programar para arrancar: tú dices el QUÉ, el equipo resuelve el CÓMO.

---

## Paso 5 — Cosas que puedes probar de una

- Escribe **`/commit`** para que te arme un commit limpio (mensaje claro de lo que cambió).
- Pide *"revisa los últimos cambios con el agente code-reviewer"* para cazar errores antes de publicar.
- Pide *"diseña la pantalla de X con el agente designer"* para una interfaz cuidada.
- ¿Necesitas ideas de prompts? Mira **`examples/prompts.md`** (listos para copiar y pegar).

---

## Paso 6 — Hazlo tuyo

Cuando quieras adaptar el proyecto a lo tuyo:

1. **Edita `CLAUDE.md`** con las reglas reales de tu proyecto: idioma, tu stack (lenguajes/herramientas), convenciones,
   y **qué nunca debe tocar** (por ejemplo, no hacer `git push` sin avisar). Claude respeta lo que escribas ahí.
2. **Ajusta `.claude/settings.json`** (permisos: qué comandos puede correr sin preguntar) y **`.claude/hooks/format.sh`**
   (el formateador que corre solo tras cada edición) a tu stack.
3. Copia la carpeta `.claude/` + `CLAUDE.md` a cualquier otro proyecto tuyo para llevarte el mismo equipo.

---

## Mini-mapa de la carpeta

```
CLAUDE.md          → reglas del proyecto + cómo orquesta al equipo (Claude lo lee primero)
.claude/agents/    → el equipo de 9 agentes
.claude/skills/    → capacidades reutilizables (product-ui-design)
.claude/commands/  → atajos como /commit
.claude/hooks/     → scripts que corren solos (ej. formatear)
.claude/plugins/   → empaqueta agentes+comandos+hooks para compartir
examples/prompts.md → prompts listos para arrancar
docs/              → guía visual de Claude Code
```
(El detalle de cada pieza está en el `README.md`.)

---

## Problemas comunes

- **"No veo los agentes / comandos."** Asegúrate de haber abierto Claude Code **dentro** de la carpeta del proyecto
  (donde está `CLAUDE.md`) y de tener Claude Code actualizado.
- **"No quiero que haga cierta acción sin permiso."** Ajusta los permisos en `.claude/settings.json`.
- **"Quiero cambiar el idioma o el estilo de respuesta."** Edítalo en `CLAUDE.md`; Claude lo toma de ahí.
- **"Empecé a pedir algo y no me hizo preguntas."** Pídele explícitamente: *"levanta los requerimientos con pm-status
  antes de construir"*.

---

¿Listo? Vuelve al **Paso 4** y pídele al equipo lo que quieras construir. Licencia MIT — úsalo y modifícalo libre.
