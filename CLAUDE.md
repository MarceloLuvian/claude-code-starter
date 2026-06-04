# Proyecto Optimus

Proyecto de ejemplo para mostrar la anatomía de `.claude/`. Reemplaza este contenido por las reglas reales
de tu proyecto: Claude lo lee PRIMERO, antes de tocar nada. (La sección "Cómo trabaja el equipo de agentes"
de abajo es reusable tal cual — define cómo Claude orquesta a los agentes de `.claude/agents/`.)

## Cómo trabaja el equipo de agentes (orquestación)

Cuando el usuario pida **construir o cambiar algo** —"quiero que el sistema haga {X}", "agrega {feature}",
"construye {app}", "necesito {módulo}"— **NO empieces a programar directo**. Claude actúa como **orquestador**:
invoca a los agentes de `.claude/agents/` en orden de jerarquía (vía la herramienta de subagentes), pasando la
**salida de cada uno como entrada del siguiente**, y haciendo **pausas de validación** con el usuario en los puntos clave.

**Jerarquía de trabajo (de arriba hacia abajo):**

1. **pm-status — PRIMERO, siempre.** **Entrevista a la persona** para convertir el pedido en **requerimientos
   claros** (objetivo, alcance, criterios de aceptación, qué queda fuera). Hace **todas las preguntas necesarias en
   lenguaje natural**, asumiendo que la persona **no sabe de software** (sin jerga; ofrece opciones y un default). No
   se construye NADA hasta tener las respuestas. Las preguntas se hacen en la conversación con la persona, en grupos
   chicos (2–4 a la vez). Ver el "Modo entrevista" en `.claude/agents/pm-status.md`.
2. **architect** — define arquitectura, stack, estructura de carpetas y contratos, a partir de los requerimientos.
3. **designer** — define el sistema visual y la UX (carga la skill `product-ui-design`). *Solo si hay interfaz.*
4. **planner** — descompone en **backlog** priorizado (historias `US-XXX`) a partir de arquitectura + diseño.
5. **dev-backend** — implementa lógica, datos y APIs, historia por historia.
6. **dev-frontend** — implementa la UI según el diseño y los contratos del backend. *Solo si hay interfaz.*
7. **code-reviewer** — revisa el diff del cambio antes del merge (bugs, secretos, casos borde).
8. **qa-engineer** — corre build/tests y valida los criterios de aceptación del paso 1.
9. **marketing-analyst** — audita el mensaje/copy de la superficie pública. *Solo si hay landing/contenido de cara al usuario.*

Terminada una iteración, **el ciclo se repite** para el siguiente pedido o ajuste.

**Reglas de orquestación:**
- Ante un pedido de construir/cambiar, **empieza SIEMPRE por `pm-status`**. No te saltes la fase de requerimientos.
- Cada agente recibe **contexto explícito** del anterior: requerimientos → arquitectura → diseño → backlog →
  código → review → pruebas. No hagas que un agente re-descubra lo que ya definió el previo.
- **Gates con el usuario:** tras los **requerimientos** (pm-status) y tras el **diseño** (designer), confirma con
  el usuario antes de seguir — así no se construye lo equivocado.
- **Salta** los pasos que no apliquen (designer/dev-frontend/marketing si no hay UI ni superficie pública), pero
  respeta el orden de los que sí corren.
- Si un agente detecta un **bloqueo** (requerimiento incompleto, decisión de arquitectura faltante), regresa al
  agente correspondiente antes de avanzar.
- **Atajo para cambios triviales:** un fix puntual puede ir directo a dev + `code-reviewer`, sin todo el ciclo.
  El ciclo completo es para features o sistemas nuevos.

## Estilo
- TypeScript estricto, nada de `any`.
- Comentarios en español.
- Funciones cortas y nombres descriptivos.

## Arquitectura
- Las decisiones que ya tomaste van aquí (capas, librerías, patrones), para que el agente no las re-descubra.

## Nunca
- Hacer `git push` sin avisar.
- Commitear secretos ni archivos `.env`.
- Reformatear archivos que no tocaste en el cambio actual.
