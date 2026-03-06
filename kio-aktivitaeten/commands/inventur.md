---
description: "Aktivitäten-Inventur starten — 30-Minuten geführte Erfassung aller Team-Tätigkeiten"
argument-hint: "<Prozessbereich oder 'komplett'>"
allowed-tools: ["Read", "Write", "Task"]
---

```
┌─────────────────────────────────────────────────────────┐
│                    AKTIVITÄTEN-INVENTUR                  │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Geführte 30-Min Erfassung aller Team-Aktivitäten    │
│  ✓ Kategorisierung nach A/B/C-Wertigkeit               │
│  ✓ Zeitaufwand und Energielevel pro Aktivität           │
│  ✓ Strukturierte CSV-Ausgabe                            │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Kalender: Aktivitäten aus Terminen ableiten          │
│  + Zeiterfassung: Echte Zeitdaten importieren           │
│  + Projektmanagement: Tasks als Aktivitäten mappen      │
└─────────────────────────────────────────────────────────┘
```

# /inventur

Starte eine geführte Aktivitäts-Inventur. Der `inventur-coach` Agent führt dich in ~30 Minuten durch eine strukturierte Erfassung aller Team-Aktivitäten.

## Was ich brauche

**Option A: Geführter Dialog**
Ich stelle dir systematisch Fragen zu deinen Aktivitäten — Schritt für Schritt.

**Option B: Aktivitäten-Liste**
Beschreibe deine typische Arbeitswoche: "Montags mache ich Reportings, dann Kundengespräche..."

---

## Die 4 Phasen

### Phase 1: Warm-up (2 Min)
Der Agent beginnt locker: "Erzähl mir mal — womit hast du heute Morgen angefangen?"

Kein Druck, kein Formular. Einfach erzählen was kommt.

### Phase 2: Freie Erfassung (15 Min)
Du nennst Aktivitäten in natürlicher Sprache, der Agent hört zu und stellt gezielte Rückfragen:
- "Was noch? Was machst du regelmäßig das du noch nicht erwähnt hast?"
- "Gibt es Dinge die du erledigst obwohl du eigentlich keine Zeit dafür hast?"
- "Was würde liegenbleiben wenn du eine Woche krank wärst?"

### Phase 3: Strukturierung (8 Min)
Für jede erfasste Aktivität fragt der Agent kurz nach:
- **Status**: Gehört zu deiner Rolle? Oder ein anderer Grund? (6 Kategorien)
- **Energie**: Gibt Energie oder kostet Energie?
- **Zeit**: Wie viele Stunden pro Frequenz-Einheit?
- **Frequenz**: Täglich / wöchentlich / monatlich / quartalsweise / jährlich
- **Wert**: Hoch (direkt nützlich) / Mittel / Niedrig (Pflicht aber wenig Mehrwert)

### Phase 4: Zusammenfassung (5 Min)
Der Agent zeigt eine Tabelle aller erfassten Aktivitäten zur Bestätigung. Du kannst ergänzen, korrigieren oder direkt bestätigen.

---

## Output-Template

Nach der Session schreibt der inventur-coach `context/aktivitaeten.json`:

```json
[
  {
    "id": "akt-001",
    "name": "Wochenbericht erstellen",
    "wer": "Max",
    "status": "rolle",
    "energie": "negativ",
    "stunden": 1.5,
    "frequenz": "wöchentlich",
    "wert": "mittel",
    "quadrant": "automatisieren",
    "systeme": ["Excel", "Outlook"],
    "notizen": "Daten aus 3 Quellen zusammensuchen, dann formatieren",
    "erfasst_am": "2026-03-06"
  }
]
```

Und zeigt eine Zusammenfassung:

```
Inventur abgeschlossen

Erfasst: 14 Aktivitäten
Quadranten:
  Automatisieren:  6 (z.B. Wochenbericht, Meeting-Protokolle)
  Optimieren:      4 (z.B. Angebote erstellen)
  Behalten:        3 (z.B. Kundengespräche)
  Eliminieren:     1 (z.B. Status-Meeting ohne Ergebnis)

Nächster Schritt: /analyse
```

---

## Mehrere Sessions

Du kannst `/inventur` mehrfach aufrufen — neue Aktivitäten werden zu bestehenden ergänzt. Duplikate erkenne ich automatisch.

