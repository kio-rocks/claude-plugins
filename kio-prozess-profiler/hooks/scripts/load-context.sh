#!/usr/bin/env bash
set -euo pipefail
# load-context.sh
# Wird bei jedem Session-Start ausgeführt.
# Lädt Profil und Prozess-Fortschritt und gibt eine Kontext-Zusammenfassung aus.

PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-$(dirname "$(dirname "$(realpath "$0")")")}"
CONTEXT_DIR="$PLUGIN_ROOT/context"
PROFIL_FILE="$CONTEXT_DIR/profil.json"
PROZESSE_FILE="$CONTEXT_DIR/prozesse.json"

# Profil laden
if [ -f "$PROFIL_FILE" ]; then
  NAME=$(jq -r '.name // "Unbekannt"' "$PROFIL_FILE" 2>/dev/null | head -c 50 | tr -cd '[:alnum:][:space:]-äöüÄÖÜß' || echo "Unbekannt")
  ROLLE=$(jq -r '.rolle // ""' "$PROFIL_FILE" 2>/dev/null | head -c 50 | tr -cd '[:alnum:][:space:]-äöüÄÖÜß' || echo "")
  echo "=== KIO Prozess-Profiler ==="
  echo "Willkommen zurück, $NAME ($ROLLE)"
else
  echo "=== KIO Prozess-Profiler ==="
  echo "Kein Profil gefunden. Starte mit /profil-anlegen um dein Profil anzulegen."
  cat "$PLUGIN_ROOT/context/welcome.md" 2>/dev/null || true
  exit 0
fi

# Prozess-Fortschritt laden
if [ -f "$PROZESSE_FILE" ]; then
  BEREICHE=$(jq -r 'length // 0' "$PROZESSE_FILE" 2>/dev/null || echo "0")
  AKTIVITAETEN=$(jq -r '[.[].aktivitaeten | length] | add // 0' "$PROZESSE_FILE" 2>/dev/null || echo "0")
  EXTRAHIERT=$(jq -r '[.[].aktivitaeten[] | select(.status == "extrahiert" or .status == "validiert")] | length // 0' "$PROZESSE_FILE" 2>/dev/null || echo "0")
  VALIDIERT=$(jq -r '[.[].aktivitaeten[] | select(.status == "validiert")] | length // 0' "$PROZESSE_FILE" 2>/dev/null || echo "0")

  echo ""
  echo "Fortschritt:"
  echo "  - $BEREICHE Prozessbereich(e)"
  echo "  - $AKTIVITAETEN Aktivitäten erkannt"
  echo "  - $EXTRAHIERT extrahiert"
  echo "  - $VALIDIERT validiert"

  if [ "$AKTIVITAETEN" -gt 0 ] && [ "$EXTRAHIERT" -lt "$AKTIVITAETEN" ]; then
    OFFEN=$((AKTIVITAETEN - EXTRAHIERT))
    echo ""
    echo "  $OFFEN Aktivität(en) noch offen. Weiter mit /regelwerk-extraktion"
  elif [ "$VALIDIERT" -lt "$EXTRAHIERT" ]; then
    echo ""
    echo "  Extraktion abgeschlossen. Weiter mit /regelwerk-export"
  fi
else
  echo ""
  echo "Noch keine Prozesse erfasst. Starte mit /regelwerk-extraktion für eine Interview-Session."
fi

echo ""
echo "Commands: /profil-anlegen /regelwerk-extraktion /profiling-status /regelwerk-export /daten-löschen"
