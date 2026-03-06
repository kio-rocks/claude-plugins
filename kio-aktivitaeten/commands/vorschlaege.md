---
description: "Automatisierungsvorschläge — Top 5 Verbesserungen mit Aufwand-Nutzen-Analyse"
argument-hint: "<Bereich oder Aktivität>"
allowed-tools: ["Read", "Write"]
---

```
┌─────────────────────────────────────────────────────────┐
│               AUTOMATISIERUNGSVORSCHLÄGE                │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Liest Inventur- und Analyse-Daten                   │
│  ✓ Top 5 Vorschläge nach Impact/Effort gerankt         │
│  ✓ Passendes Delivery-Format pro Vorschlag             │
│  ✓ Schreibt context/vorschlaege.json für /baustein     │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Tool-Registry: Verfügbare APIs automatisch prüfen    │
│  + Kostenrechner: ROI mit echten Lizenzkosten           │
│  + Marketplace: Fertige Lösungen vorschlagen            │
└─────────────────────────────────────────────────────────┘
```

# /vorschlaege

Erhalte die Top-5 Automatisierungsvorschläge aus deiner Aktivitäts-Inventur — gerankt nach Impact/Effort-Verhältnis, mit Angabe des passenden Delivery-Formats und konkreten nächsten Schritten.

## Was ich brauche

**Option A: Aus Inventur-Daten (empfohlen)**
Führe zuerst `/inventur` und `/analyse` durch. Die Vorschläge basieren auf `context/aktivitaeten.json` und `context/analyse.json`.

**Option B: Aktivität beschreiben**
Beschreibe eine oder mehrere Aktivitäten: "Ich erstelle jeden Montag einen Wochenbericht aus 3 Excel-Dateien — das dauert 2 Stunden."

---

## Bewertungs-Algorithmus

Für jede Aktivität prüfe ich:

### Impact (Was bringt die Automatisierung?)
- **Zeitersparnis**: Stunden/Woche x 52 Wochen
- **Energie-Entlastung**: Aktivitäten die Energie kosten, prioritär behandeln
- **Fehlerreduktion**: Repetitive manuelle Aufgaben mit Fehlerrisiko
- **Skalierbarkeit**: Aktivitäten die mit Wachstum überproportional wachsen

### Effort (Was kostet die Umsetzung?)
- **Technische Komplexität**: Wie viele Systeme? Gibt es APIs?
- **Datenverfügbarkeit**: Sind die Daten strukturiert und zugänglich?
- **Abhängigkeiten**: Brauche ich externe Freigaben oder Integrationen?

### Delivery-Format-Matching
| Situation | Format |
|-----------|--------|
| Google Workspace | Apps Script |
| KI-gestützter Prozess, Claude Desktop | Claude Skill ZIP |
| Dashboard, Template, Visualisierung | Artifact |

---

## Output-Template

```
Top-5 Automatisierungsvorschläge

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#1 Wochenbericht automatisieren
   Impact:  Hoch  (2h/Woche → 10 Min, spart 93 h/Jahr)
   Effort:  Mittel (Daten aus Sheets, Output nach Docs)
   Format:  Apps Script

   Warum: Wöchentliche Wiederholung, klares Muster, Daten aus Sheets
   Wie:   Script liest KPIs, formatiert Bericht, mailt ihn automatisch

   → /baustein Wochenbericht

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#2 Tages-Status-Update vereinfachen
   Impact:  Hoch  (5h/Woche → 30 Min)
   Effort:  Gering (nur Texteingabe + Template)
   Format:  Claude Skill ZIP

   Warum: Täglich, kostet viel Energie, klare Struktur
   Wie:   Skill fragt 3 Fragen, generiert strukturierten Update

   → /baustein Status-Update

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#3 Meeting-Protokoll-Vorlage
   Impact:  Mittel (1h/Woche → 10 Min)
   Effort:  Gering (Template-basiert)
   Format:  Artifact

   Warum: Wiederkehrendes Format, einfach standardisierbar
   Wie:   Artifact mit ausfüllbarer Vorlage + Auto-Zusammenfassung

   → /baustein Meeting-Protokoll

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#4 CRM-Datenpflege
   Impact:  Mittel (3h/Woche → 30 Min)
   Effort:  Hoch   (CRM-API, Daten-Mapping)
   Format:  Konfigurations-Anleitung

   Warum: Zeitaufwändig und fehleranfällig
   Wie:   CRM-API-Integration + Konfigurations-Anleitung

   → /baustein CRM-Datenpflege

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#5 E-Mail-Routing-Regeln
   Impact:  Mittel (2h/Woche → 20 Min)
   Effort:  Gering (Gmail-Filter)
   Format:  Apps Script

   Warum: Einfach zu implementieren, sofortiger Effekt
   Wie:   Gmail-Filter-Script + Labeling-Regeln

   → /baustein E-Mail-Routing

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Gesamtpotenzial: ~11h/Woche → ~2h/Woche = 9h/Woche gespart (468h/Jahr)

Nächster Schritt: /baustein [Name] um einen Vorschlag umzusetzen
```

---

## Gezielter Vorschlag

Mit `/vorschlaege Wochenbericht` bekomme ich:
- Tiefere Analyse dieser einen Aktivität
- Alle möglichen Automatisierungsansätze
- Konkrete Implementierungsoptionen mit Pros/Cons
- Direkte Weiterleitung zu `/baustein`

