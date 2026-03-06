---
name: regel-extraktion
description: >
  Führt die Tiefenextraktion für eine identifizierte Aktivität durch.
  Geht systematisch 6 Dimensionen durch: Trigger, Schritte, Systeme,
  Output, Regeln/Schwellwerte, Ausnahmen. Wird ausgelöst durch
  "Frag mich zu [Aktivität]", "Extrahiere die Regeln für...",
  "Lass uns [Aktivität] durchgehen" oder vom profiler-coach Agent.
---

# Regel-Extraktion

Schritt 2 der Prozess-Profiler-Journey: Tiefenextraktion pro Aktivität über 6 Dimensionen.

## Trigger-Phrases

- "Frag mich zu [Aktivität]"
- "Extrahiere die Regeln für..."
- "Lass uns [Aktivität] durchgehen"
- "Was willst du über [Aktivität] wissen?"
- Wird automatisch vom profiler-coach Agent aufgerufen

## Input

Eine identifizierte Aktivität aus `context/prozesse.json` (Status: "erkannt" oder "in-extraktion").

## Algorithmus

### Vorbereitung

1. Setze Status der Aktivität auf "in-extraktion"
2. Lese die bisherige Beschreibung (falls vorhanden)
3. Plane die 6 Dimensionen als Frage-Leitfaden

### Dimension 1: Trigger

**Frage:** "Was löst [Aktivität] aus? Machst du das zu einer festen Zeit, oder wenn etwas Bestimmtes passiert?"

Ziel: Konkreten Trigger mit Typ und Beschreibung erfassen.

| Trigger-Typ | Beispiele |
|-------------|-----------|
| zeitbasiert | "Jeden Werktag morgens", "Montags um 9" |
| ereignisbasiert | "Wenn eine neue Bestellung reinkommt", "Nach dem Meeting" |
| bedingungsbasiert | "Nur wenn offene Aufträge existieren", "Bei Lagerbestandsänderung" |

### Dimension 2: Schritte

**Frage:** "Was ist der erste Schritt? Was machst du genau?"

Dann Schritt für Schritt durchgehen. Pro Schritt erfassen:
- Was wird getan?
- In welchem System?
- Relevante Details?

**Nachhaken:** "Was kommt danach? Gibt es eine feste Reihenfolge?"

### Dimension 3: Systeme

**Frage:** "Welche Systeme oder Tools öffnest du dafür?"

Pro System erfassen:
- Name
- Wofür genutzt (welcher Schritt)
- Zugriffspunkt (URL, Modul, Bereich)

### Dimension 4: Output

**Frage:** "Was ist das Ergebnis? Wer bekommt es? In welchem Format?"

Erfassen:
- Format (E-Mail, Excel, Report, Systemeintrag, ...)
- Empfänger
- Konkreter Inhalt

### Dimension 5: Regeln und Schwellwerte

**Frage:** "Gibt es konkrete Werte oder Grenzen, die du beachtest?"

Hier die Tiefe suchen. Nutze die Nachfrage-Muster aus `references/dimensionen.md`.

Regel-Typen:
- **Schwellwert:** Ab/bis-Werte (">36h = kritisch")
- **Klassifikation:** Einteilung in Kategorien ("4 Statusgruppen")
- **Berechnung:** Formeln ("Einkaufspreis / (1 - Zielmarge)")
- **Zuordnung:** Mapping ("Deal-Aktion = alle 4 Formate")

### Dimension 6: Ausnahmen

**Frage:** "Was passiert wenn [übliche Annahme] nicht zutrifft? Gibt es Sonderfälle?"

Aktiv prüfen -- es gibt IMMER Ausnahmen. Typische Auslöser:
- Feiertage, Urlaubszeit
- Sonderkunden, VIP-Behandlung
- Systemausfälle, fehlende Daten
- Erstmalige vs. wiederkehrende Fälle

## Gesprächsregeln

1. **Eine Frage pro Nachricht.** Maximal zwei, wenn sie direkt zusammenhängen.
2. **Zitiere den User.** "Du hast gesagt, du filterst nach Status -- welche Status gibt es?"
3. **Erkenne implizite Regeln.** "Das mache ich immer morgens" = Trigger (zeitbasiert, täglich, morgens).
4. **Bestätige Zwischenstände.** Nach 3-4 Fragen zusammenfassen.
5. **Sei konkret, nicht abstrakt.** Nicht "Wie entscheidest du?" sondern "Du hast erwähnt, manche Bestellungen löst du aus und manche nicht -- woran machst du das fest?"

## Output

Nach vollständiger Extraktion: Aktivität in `context/prozesse.json` aktualisieren mit allen 6 Dimensionen. Status auf "extrahiert" setzen.

Zeige dem User das extrahierte Profil im Format aus `references/output-template.md` (via shared reference) und frage: "Stimmt das so? Fehlt etwas?"

## Klassifikation

Nach Extraktion die A/B/C-Klasse bestimmen:

- **A (Vollautomatisch):** Kein menschliches Urteil nötig. Klare Input/Output-Beziehung. Alle Regeln dokumentierbar.
- **B (Hybrid):** Vorarbeit automatisierbar, Entscheidung erfordert menschliches Urteil. Human-in-the-Loop.
- **C (Manuell):** Erfordert Kreativität, Empathie, strategisches Denken. Keine klaren Regeln ableitbar.

## Regeln

- Niemals eine Dimension überspringen
- Vage Antworten nachbohren (siehe quality-check Skill)
- Sprache: Deutsch
- Duze den User
