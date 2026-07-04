#!/bin/zsh
# Publica automáticamente los cambios del seguimiento SCL-BCN en GitHub Pages.
# Lo ejecuta launchd cada vez que cambia vuelos_scl_bcn_snapshots.json.
REPO="/Users/jcastillos/Local Documents/Claude/vuelos-scl-bcn"
cd "$REPO" || exit 1
# Limpia locks huérfanos que deja el entorno aislado de Claude
rm -f .git/HEAD.lock .git/index.lock .git/objects/maintenance.lock
git add -A
# Si no hay cambios preparados, salir sin commit
git diff --cached --quiet && exit 0
git commit -m "Actualización automática de precios: $(date '+%Y-%m-%d %H:%M')"
git push origin main
