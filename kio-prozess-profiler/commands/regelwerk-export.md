---
description: "Regelwerk exportieren — fertige Prozessregeln als strukturiertes Markdown"
argument-hint: "<Prozessbereich oder 'alle'>"
allowed-tools: ["Read"]
---

┌─────────────────────────────────────────────────────────┐
│                   REGELWERK-EXPORT                       │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Validierte Aktivitäten als Markdown formatieren      │
│  ✓ Gesamtübersicht-Tabelle erstellen                    │
│  ✓ Detail-Profile pro Aktivität ausgeben                │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Confluence: Direkt als Wiki-Seite publizieren        │
│  + Notion: Export in Notion-Datenbank                    │
│  + PDF: Formatierter PDF-Export für Management           │
└─────────────────────────────────────────────────────────┘

# /regelwerk-export

Exportiere das extrahierte Regelwerk als strukturiertes Markdown-Artifact. Copy-Paste-Ready für Dokumentation, SOPs oder als Grundlage für Automatisierungen.

## Was ich brauche

**Option A: Alles exportieren**
Ohne Argument oder mit "alle" -- exportiert das gesamte Regelwerk.

**Option B: Bereich auswählen**
Nenne einen Prozessbereich: "Logistik Tagesgeschäft" -- exportiert nur diesen Bereich.

---

## Voraussetzungen

- Mindestens eine Aktivität mit Status "extrahiert" oder "validiert" in `context/prozesse.json`
- Wenn keine Aktivitäten vorhanden: Hinweis auf `/regelwerk-extraktion`
- Wenn Aktivitäten nur "erkannt" sind: Hinweis dass erst extrahiert werden muss

---

## Ergebnis

### Gesamtübersicht

```markdown
## Gesamtübersicht: {{Prozessbereich}}

| # | Aktivität | Trigger | Systeme | Regeln | Ausnahmen | Klasse |
|---|-----------|---------|---------|--------|-----------|--------|
| 1 | {{Name}}  | {{kurz}}| {{Liste}}| {{Anzahl}}| {{Anzahl}}| A/B/C |
```

### Detail pro Aktivität

Jede Aktivität wird im Format aus `skills/regelwerk-export/references/output-template.md` ausgegeben:

- Metadaten (Name, Bereich, Frequenz, Zeitaufwand, Klasse)
- Trigger
- Schritte mit System-Zuordnung
- Systeme
- Output
- Regeln und Schwellwerte
- Ausnahmen und Sonderfälle
- Abhängigkeiten

---

## Abschluss-Hinweis

Nach dem Export:

> Das Regelwerk ist die Grundlage für jede Art von Automatisierung -- ob mit KI-Agenten, Scripts oder manuellen SOPs. Jede dokumentierte Regel kann potenziell automatisiert werden.

---

## Regeln

- Nur Aktivitäten mit Status "extrahiert" oder "validiert" exportieren
- Aktivitäten mit Status "erkannt" oder "in-extraktion" separat auflisten als "noch nicht extrahiert"
- Sprache: Deutsch
- Duze den User
