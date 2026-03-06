# Kanonisches Datenmodell: KIO Aktivitäten

Single Source of Truth für alle Komponenten des kio-aktivitaeten Plugins.

## JSON-Schema

```json
{
  "id": "akt-001",
  "name": "Wochenbericht erstellen",
  "wer": "Max",
  "status": "rolle",
  "energie": "negativ",
  "frequenz": "wöchentlich",
  "stunden": 1.5,
  "wert": "mittel",
  "quadrant": "automatisieren",
  "systeme": ["Excel", "Outlook"],
  "notizen": "Daten aus 3 Quellen zusammensuchen",
  "erfasst_am": "2026-03-06"
}
```

## Erlaubte Enum-Werte

| Feld | Erlaubte Werte |
|------|----------------|
| `status` | `rolle`, `sonst-niemand`, `andere-lösung`, `team`, `kein-prozess`, `prozess-defekt` |
| `energie` | `positiv`, `negativ` |
| `frequenz` | `täglich`, `wöchentlich`, `monatlich`, `quartalsweise`, `jährlich` |
| `wert` | `hoch`, `mittel`, `niedrig` |
| `quadrant` | `automatisieren`, `optimieren`, `behalten`, `eliminieren` |

## Feld-Beschreibungen

| Feld | Typ | Beschreibung |
|------|-----|-------------|
| `id` | String | Universelle ID im Format `akt-NNN` (hochzählend) |
| `name` | String | Kurze Bezeichnung der Aktivität (max. 60 Zeichen) |
| `wer` | String | Vorname des Teammitglieds |
| `status` | Enum | Warum die Person diese Aktivität ausführt (6 Werte) |
| `energie` | Enum | Ob die Aktivität Energie gibt oder kostet (binär) |
| `frequenz` | Enum | Wie oft die Aktivität ausgeführt wird |
| `stunden` | Float | Zeitaufwand pro Frequenz-Einheit in Stunden |
| `wert` | Enum | Wirtschaftlicher Wert der Aktivität |
| `quadrant` | Enum | Können/Wollen-Einordnung |
| `systeme` | String[] | Genutzte Tools und Programme |
| `notizen` | String | Freitext-Notizen (optional) |
| `erfasst_am` | String | ISO-Datum der Erfassung |

## Status-Mapping (Dialog → Enum)

| Was der User sagt | Enum-Wert |
|-------------------|-----------|
| "Gehört zu meiner Rolle" | `rolle` |
| "Weil es sonst niemanden gibt" | `sonst-niemand` |
| "Andere Lösung ist nötig" | `andere-lösung` |
| "Mein Team führt es aus" | `team` |
| "Kein Prozess vorhanden" | `kein-prozess` |
| "Prozess funktioniert nicht" | `prozess-defekt` |

## CSV-Spalten-Mapping

| CSV-Spalte | JSON-Feld |
|------------|-----------|
| ID | `id` |
| Wer | `wer` |
| Name | `name` |
| Status | `status` |
| Energie | `energie` |
| Anzahl Stunden | `stunden` |
| Frequenz | `frequenz` |
| Wert | `wert` |
| Quadrant | `quadrant` |
