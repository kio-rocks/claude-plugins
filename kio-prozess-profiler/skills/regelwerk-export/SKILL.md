---
name: regelwerk-export
description: >
  Formatiert alle extrahierten und validierten Aktivitäten als strukturiertes
  Markdown-Artifact. Erstellt Gesamtübersicht-Tabelle und Detail-Profile.
  Wird ausgelöst durch "Exportiere das Regelwerk", "/regelwerk-export" oder
  "Zeig mir das dokumentierte Regelwerk".
---

# Regelwerk-Export

Schritt 3 der Prozess-Profiler-Journey: Export-Formatierung als Markdown-Artifact.

## Trigger-Phrases

- "Exportiere das Regelwerk"
- "Zeig mir die Dokumentation"
- "Regelwerk ausgeben"
- /regelwerk-export Command

## Input

`context/prozesse.json` -- alle Aktivitäten mit Status "extrahiert" oder "validiert".

## Algorithmus

### 1. Daten laden

Lese `context/prozesse.json` und `context/profil.json`.

### 2. Filtern

- Nur Aktivitäten mit Status "extrahiert" oder "validiert" exportieren
- Aktivitäten mit Status "erkannt" oder "in-extraktion" separat auflisten als "noch nicht extrahiert"

### 3. Gesamtübersicht erstellen

```markdown
## Gesamtübersicht: [Prozessbereich]

Erstellt am: [Datum]
Profil: [Name], [Rolle]

| # | Aktivität | Trigger | Systeme | Regeln | Ausnahmen | Klasse |
|---|-----------|---------|---------|--------|-----------|--------|
| 1 | [Name]    | [kurz]  | [Liste] | [Anzahl] | [Anzahl] | A/B/C |
```

### 4. Detail-Profile

Pro Aktivität das Template aus `references/output-template.md` anwenden:

- Metadaten (Name, Bereich, Frequenz, Zeitaufwand, Klasse)
- Trigger
- Schritte mit System-Zuordnung
- Systeme
- Output
- Regeln und Schwellwerte
- Ausnahmen und Sonderfälle
- Abhängigkeiten

### 5. Abschluss-Hinweis

> Das Regelwerk ist die Grundlage für jede Art von Automatisierung -- ob mit KI-Agenten, Scripts oder manuellen SOPs. Jede Aktivität der Klasse A oder B kann potenziell automatisiert werden.

## Output

Markdown-Artifact (Copy-Paste-Ready). Kein JSON, kein Code -- reines Markdown.

## Regeln

- Reihenfolge: Erst Klasse A, dann B, dann C
- Jede Regel und Ausnahme nummerieren (R1, R2, ... / A1, A2, ...)
- Keine Informationen hinzufügen die nicht extrahiert wurden
- Sprache: Deutsch
- Duze den User
