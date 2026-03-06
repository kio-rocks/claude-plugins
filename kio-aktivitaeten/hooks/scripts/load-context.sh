#!/usr/bin/env bash
set -euo pipefail
# load-context.sh
# Wird bei jedem Session-Start ausgeführt.
# Lädt Profil und Fortschritt und gibt eine Kontext-Zusammenfassung aus.

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(realpath "$0")")")}"
CONTEXT_DIR="$PLUGIN_ROOT/context"
PROFIL_FILE="$CONTEXT_DIR/profil.json"
AKTIVITAETEN_FILE="$CONTEXT_DIR/aktivitaeten.json"

# Profil laden
if [ -f "$PROFIL_FILE" ]; then
  NAME=$(jq -r '.name // "Unbekannt"' "$PROFIL_FILE" 2>/dev/null | head -c 50 | tr -cd '[:alnum:][:space:]-äöüÄÖÜß' || echo "Unbekannt")
  ROLLE=$(jq -r '.rolle // ""' "$PROFIL_FILE" 2>/dev/null | head -c 50 | tr -cd '[:alnum:][:space:]-äöüÄÖÜß' || echo "")
  echo "=== KIO Aktivitäten-Plugin ==="
  echo "Willkommen zurück, $NAME ($ROLLE)"
else
  echo "=== KIO Aktivitäten-Plugin ==="
  echo "Kein Profil gefunden. Starte mit /team-profil um dein Profil anzulegen."
  cat "$PLUGIN_ROOT/context/welcome.md" 2>/dev/null || true
  exit 0
fi

# Aktivitäten-Fortschritt laden
if [ -f "$AKTIVITAETEN_FILE" ]; then
  ANZAHL=$(jq -r '.aktivitaeten | length // 0' "$AKTIVITAETEN_FILE" 2>/dev/null || echo "0")
  ANALYSIERT=$(jq -r '.meta.analysiert // false' "$AKTIVITAETEN_FILE" 2>/dev/null || echo "false")

  echo ""
  echo "Fortschritt:"
  echo "  - $ANZAHL Aktivitäten erfasst"
  if [ "$ANALYSIERT" = "true" ]; then
    echo "  - Analyse vorhanden"
  else
    echo "  - Noch keine Analyse (starte mit /analyse)"
  fi
else
  echo ""
  echo "Noch keine Aktivitäten erfasst. Starte mit /inventur für eine geführte Session."
fi

echo ""
echo "Commands: /team-profil /inventur /analyse /vorschlaege /baustein /inventur-status /daten-loeschen"
