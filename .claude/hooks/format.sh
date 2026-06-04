#!/usr/bin/env bash
# Hook PostToolUse: corre el formateador después de cada Edit/Write.
# Cableado en .claude/settings.json (matcher "Edit|Write"). Ajusta el comando a tu stack.
set -e

# Ejemplo con Prettier si el proyecto lo tiene; cámbialo por tu formateador (eslint --fix, dotnet format, etc.)
if command -v npx >/dev/null 2>&1 && [ -f package.json ]; then
  npx --no-install prettier --write . >/dev/null 2>&1 || true
fi

exit 0
