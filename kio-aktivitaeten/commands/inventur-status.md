---
description: "Inventur-Fortschritt anzeigen — erfasste Aktivitäten, offene Bereiche, nächste Schritte"
allowed-tools: ["Read"]
---

```
┌─────────────────────────────────────────────────────────┐
│                   INVENTUR-STATUS                       │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Liest alle context/*.json Dateien                   │
│  ✓ Journey-Fortschritt auf einen Blick                 │
│  ✓ Zeitersparnis-Bilanz umgesetzter Bausteine          │
│  ✓ Klarer nächster Schritt                             │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Zeiterfassung: Echte vs. geschätzte Zeitersparnis    │
│  + Projektmanagement: Umsetzungs-Tasks tracken          │
│  + Dashboard: Live-Fortschritt im Browser               │
└─────────────────────────────────────────────────────────┘
```

# /inventur-status

Zeige deinen Fortschritt in der Aktivitäten-Journey: Wie viele Aktivitäten erfasst, wie viele analysiert, wie viele Vorschläge offen, wie viele Bausteine bereits umgesetzt.

## Was ich brauche

**Option A: Automatisch**
Ich lese alle vorhandenen context/-Dateien und zeige den aktuellen Stand — kein Input nötig.

**Option B: Gezielter Check**
Frage direkt: "Wie weit bin ich mit der Inventur?" oder "Welche Bausteine sind noch offen?"

---

## Output-Template

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Aktivitäten-Journey Status
  Max Mustermann · Teamleiter Operations
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Inventur
   14 Aktivitäten erfasst
   Letzte Session: 2026-02-20

Analyse
   14 Aktivitäten analysiert
   Automatisierungspotenzial: 6 Aktivitäten (43%)
   Geschätztes Sparpotenzial: 11h/Woche

Vorschläge
   5 Vorschläge generiert
   Offen:     3 (Wochenbericht, CRM-Datenpflege, E-Mail-Routing)
   In Arbeit: 1 (Status-Update — Baustein erstellt)
   Umgesetzt: 1 (Meeting-Protokoll)

Bausteine
   2 Bausteine erstellt
   Umgesetzt:  1 (Meeting-Protokoll — spart 1h/Woche)
   Bereit:     1 (Status-Update — wartet auf Setup)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Zeitersparnis (bereits umgesetzt)
   Meeting-Protokoll:  1h/Woche (seit 2026-02-15)
   Gesamt:             1h/Woche = 52h/Jahr

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Nächster Schritt:
  /baustein Status-Update  (bereit, spart 5h/Woche)
```

---

## Status bei leerem Kontext

Wenn noch keine Daten vorhanden sind:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
  Aktivitäten-Journey Status
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Noch kein Profil angelegt.

So geht's los:

1. /team-profil  — Profil anlegen (2 Min)
2. /inventur     — Aktivitäten erfassen (~30 Min)
3. /analyse      — Auswertung ansehen
4. /vorschlaege  — Top-Automatisierungen entdecken
5. /baustein     — Ersten Baustein erstellen
```

