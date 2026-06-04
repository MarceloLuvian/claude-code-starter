# Prompts de ejemplo

Copia y pega estos prompts en Claude Code (con este proyecto abierto) para arrancar.

## 1) Iniciar un proyecto web nuevo (usando el equipo de agentes)

```
Quiero arrancar un proyecto web nuevo. Sigue el flujo del equipo:

1. Con el agente "planner": hazme 4-6 preguntas para entender el proyecto, luego genera las
   historias de usuario con criterios de aceptación y un backlog priorizado.
2. Con el agente "architect": propón el stack y la arquitectura (módulos, capas, carpetas,
   patrones) y guárdala en docs/architecture.md. Espera mi OK antes de seguir.
3. Con "dev-backend" y "dev-frontend": implementa la primera historia como vertical slice,
   respetando CLAUDE.md.
4. Con "qa-engineer": escribe los tests de esa historia.

Reglas: no hagas git push. Pregunta antes de decisiones grandes.
```

## 2) Usar el agente de marketing para analizar una web

```
Usa el agente "marketing-analyst" para auditar esta página: https://ejemplo.com

Dame los hallazgos priorizados (alto / medio / bajo impacto) sobre: mensaje y propuesta de valor,
llamado a la acción, jerarquía visual/UX, copy, prueba social y SEO básico. Termina con los 3
cambios de mayor impacto. Es solo análisis: no modifiques nada.
```

> Tip: cambia el `marketing-analyst` por `code-reviewer` para revisar tus cambios, o por `pm-status`
> para un reporte de estado del proyecto.
