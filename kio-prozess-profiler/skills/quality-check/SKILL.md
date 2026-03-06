---
name: quality-check
description: >
  Validiert ein extrahiertes Aktivitäts-Profil auf Vollständigkeit.
  Prüft gegen 6 Vagheits-Muster und generiert Nachfragen für
  unzureichend tiefe Antworten. Wird ausgelöst durch "Ist das
  vollständig?", "Prüfe die Extraktion", "Quality Check" oder
  automatisch nach jeder Extraktion durch den profiler-coach Agent.
---

# Quality-Check

Vollständigkeits-Validierung eines extrahierten Aktivitäts-Profils.

## Trigger-Phrases

- "Ist das vollständig?"
- "Prüfe die Extraktion"
- "Quality Check"
- Wird automatisch vom profiler-coach Agent nach jeder Extraktion aufgerufen

## Input

Ein extrahiertes Aktivitäts-Profil aus `context/prozesse.json` (Status: "extrahiert").

## Algorithmus

### 1. Dimensionen-Check

Prüfe ob alle 6 Dimensionen ausgefüllt sind:

- [ ] Trigger vorhanden (Typ + Beschreibung)
- [ ] Mindestens 2 Schritte dokumentiert
- [ ] Mindestens 1 System mit Zugriffspunkt
- [ ] Output mit Format + Empfänger
- [ ] Mindestens 1 konkrete Regel mit Wert
- [ ] Mindestens 1 Ausnahme/Sonderfall

### 2. Vagheits-Prüfung

Durchsuche alle Textfelder nach den 6 Vagheits-Mustern aus `references/quality-gates.md`.

Jeder Treffer generiert eine gezielte Nachfrage.

### 3. Ergebnis

**PASS:** Alle Dimensionen ausgefüllt, keine Vagheits-Muster gefunden.
→ Status auf "validiert" setzen.
→ Ausgabe: "Aktivität [Name] ist vollständig extrahiert und validiert."

**FAIL:** Offene Punkte gefunden.
→ Status bleibt "extrahiert".
→ Ausgabe: Liste der offenen Nachfragen.

## Output-Format

### Bei PASS

```
Quality-Check: [Aktivitätsname]
Ergebnis: PASS

Alle 6 Dimensionen vollständig. Keine vagen Angaben gefunden.
Status: validiert
```

### Bei FAIL

```
Quality-Check: [Aktivitätsname]
Ergebnis: [X] offene Punkte

1. [Dimension]: [Konkretes Problem] -- [Nachfrage]
2. [Dimension]: [Konkretes Problem] -- [Nachfrage]
...

Sollen wir die offenen Punkte jetzt klären?
```

## Regeln

- Nie "akzeptabel" oder "gut genug" -- entweder PASS oder FAIL
- Jeder FAIL-Punkt hat eine konkrete Nachfrage
- Sprache: Deutsch
- Duze den User
