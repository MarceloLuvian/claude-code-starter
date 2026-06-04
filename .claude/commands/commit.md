---
description: Arma un commit convencional con los cambios en stage (no hace push).
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*)
---

Revisa `git status` y `git diff --staged`.

- Si no hay nada en stage, dime qué archivos agregar antes de continuar.
- Crea UN solo commit con mensaje en formato convencional: `tipo(scope): resumen`, en español,
  con una línea extra explicando el *porqué* del cambio.
- NO hagas `git push`.
