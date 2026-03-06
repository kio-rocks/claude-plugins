# CSV-Struktur: aktivitaeten.csv

Kanonisches Schema: Siehe `shared/datenmodell.md` für Feldnamen und Enum-Werte.

## Spalten

| Spalte | JSON-Feld | Beschreibung |
|--------|-----------|-------------|
| ID | `id` | Eindeutige Aktivitäts-ID (Format: `akt-NNN`) |
| Wer | `wer` | Name des Teammitglieds |
| Name | `name` | Bezeichnung der Aktivität |
| Status | `status` | Eine der 6 Kategorien (siehe unten) |
| Energie | `energie` | `positiv` oder `negativ` |
| Anzahl Stunden | `stunden` | Zeitaufwand pro Frequenz-Einheit (Zahl) |
| Frequenz | `frequenz` | z.B. "wöchentlich", "monatlich" |
| Wert | `wert` | `hoch`, `mittel` oder `niedrig` |
| Quadrant | `quadrant` | z.B. "automatisieren", "behalten" |

## Status-Kategorien

Die 6 Status-Werte und ihre Bedeutung:

1. **`rolle`** — "Mache ich, gehört zu meiner Rolle" — Kernarbeit, die in deiner Stellenbeschreibung steht
2. **`sonst-niemand`** — "Mache ich, weil es sonst niemanden gibt" — Du machst es, weil sonst niemand da ist, nicht weil es zu dir gehört
3. **`andere-lösung`** — "Mache ich, andere Lösung ist erforderlich" — Es gibt ein bekanntes Problem, aber noch keine Lösung
4. **`team`** — "Mache ich, Ausführung durch mein Team" — Du delegierst die Ausführung an dein Team
5. **`kein-prozess`** — "Mache ich, weil es keinen Prozess gibt" — Niemand hat das Thema organisiert, es fehlt ein Prozess
6. **`prozess-defekt`** — "Mache ich, weil der Prozess nicht funktioniert" — Ein Prozess existiert, funktioniert aber nicht

## Frequenz-Normalisierung

Alle Frequenzen auf "wöchentlich" normalisieren für Vergleichbarkeit:

| Frequenz | Umrechnung auf Wochenstunden |
|----------|------------------------------|
| `täglich` | Stunden × 5 |
| `wöchentlich` | Stunden × 1 |
| `monatlich` | Stunden ÷ 4 |
| `quartalsweise` | Stunden ÷ 13 |
| `jährlich` | Stunden ÷ 52 |

## Wert-Extraktion

Nur den numerischen Teil aus der Wert-Spalte extrahieren:

- "10 € pro Stunde" → `10`
- "50 € pro Vorgang" → `50`
- Leerer Wert → Aktivität in wertbezogenen Analysen überspringen
