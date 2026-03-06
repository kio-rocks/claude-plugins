---
description: "Profiling-Fortschritt anzeigen — Status aller Extraktionsschritte auf einen Blick"
allowed-tools: ["Read"]
---

┌─────────────────────────────────────────────────────────┐
│                   PROFILING-STATUS                       │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Fortschritt über alle Prozessbereiche anzeigen       │
│  ✓ Offene Aktivitäten hervorheben                       │
│  ✓ Nächsten empfohlenen Schritt vorschlagen             │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Dashboard: Visueller Fortschrittsbalken              │
│  + Team-Ansicht: Status aller Team-Mitglieder           │
└─────────────────────────────────────────────────────────┘

# /profiling-status

Zeige deinen Fortschritt in der Prozess-Profiler-Journey: Wie viele Prozessbereiche erfasst, wie viele Aktivitäten identifiziert, wie viele extrahiert und validiert.

## Was ich brauche

**Option A: Einfach aufrufen**
Ohne Argumente -- zeigt den Gesamtstatus.

**Option B: Bereich eingrenzen**
Nenne einen Prozessbereich: "Logistik" -- zeigt nur den Status für diesen Bereich.

---

## Ablauf

- Liest context/profil.json und context/prozesse.json
- Zeigt Journey-Fortschritt mit klaren nächsten Schritten
- Hebt offene Aktivitäten hervor

---

## Ergebnis

```
Prozess-Profiler Status
{{Name}} - {{Rolle}}

Prozessbereiche: {{X}}

| Bereich | Aktivitäten | Erkannt | Extrahiert | Validiert |
|---------|-------------|---------|------------|-----------|
| {{Name}}  | {{N}}     | {{N}}   | {{N}}      | {{N}}     |

Gesamt: {{Y}} Aktivitäten
  Erkannt:     {{N}}
  Extrahiert:  {{N}}
  Validiert:   {{N}}

Offene Aktivitäten:
  - {{Aktivität 1}} (Status: erkannt)
  - {{Aktivität 2}} (Status: in-extraktion)

Nächster Schritt: /regelwerk-extraktion {{nächste offene Aktivität}}
```

---

## Status bei leerem Kontext

Wenn noch keine Daten vorhanden sind:

```
Prozess-Profiler Status

Noch kein Profil angelegt.

So geht's los:

1. /profil-anlegen        -- Profil anlegen (2 Min)
2. /regelwerk-extraktion  -- Prozess beschreiben und Regeln extrahieren
3. /profiling-status      -- Fortschritt prüfen
4. /regelwerk-export      -- Regelwerk exportieren
```

---

## Regeln

- Read-Only: Dieser Command ändert keine Daten
- Zeigt immer den empfohlenen nächsten Schritt
- Sprache: Deutsch
- Duze den User
