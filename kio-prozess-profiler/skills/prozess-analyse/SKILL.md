---
name: prozess-analyse
description: >
  Analysiert eine Freitext-Prozessbeschreibung des Users und identifiziert
  alle enthaltenen Aktivitäten. Wird ausgelöst durch "Ich beschreibe mal
  meinen Arbeitstag", "Mein Prozess sieht so aus", "Das ist mein Workflow"
  oder wenn der User einen Prozess in eigenen Worten beschreibt.
---

# Prozess-Analyse

Schritt 1 der Prozess-Profiler-Journey: Freitext-Beschreibung in eine strukturierte Aktivitätenliste umwandeln.

## Trigger-Phrases

- "Ich beschreibe mal meinen Arbeitstag"
- "Mein Prozess sieht so aus"
- "Das ist mein Workflow"
- "Jeden Morgen mache ich..."
- "Meine Aufgaben sind..."
- Jede längere Freitext-Beschreibung von Arbeitsprozessen

## Input

Freitext-Beschreibung des Users: Beliebig lang, verschachtelt, in natürlicher Sprache.

## Algorithmus

### 1. Gesamte Beschreibung lesen

Lies die komplette Beschreibung bevor du reagierst. Unterbreche den User nicht.

### 2. Domain erkennen

Identifiziere den Arbeitsbereich:
- Logistik, Sales, Grafik, Finanzen, HR, Kundenservice, Einkauf, IT, Marketing, Operations, ...

### 3. Aktivitäten identifizieren

Suche nach eigenständigen Aufgaben. Erkennungsmuster:
- **Verben**: "ich mache", "ich prüfe", "ich exportiere", "ich schreibe", "ich vergleiche"
- **Zeitmarker**: "jeden Morgen", "montags", "wöchentlich", "wenn X passiert"
- **Sequenzen**: "danach", "als nächstes", "dann"
- **Bedingungen**: "wenn", "falls", "bei Bedarf"

Nutze `references/aktivitaets-erkennung.md` für detaillierte Erkennungsmuster.

### 4. Liste bestätigen lassen

Zeige dem User die identifizierten Aktivitäten:

```
Ich habe folgende Aktivitäten in deiner Beschreibung erkannt:

1. [Aktivitätsname] -- [kurze Beschreibung]
2. [Aktivitätsname] -- [kurze Beschreibung]
3. ...

Stimmt das? Fehlt etwas? Soll ich etwas zusammenfassen oder aufteilen?
```

**Erst nach Bestätigung** die Liste finalisieren.

## Output

Schreibe oder erweitere `context/prozesse.json`:

```json
[
  {
    "id": "proz-001",
    "bereich": "[erkannte Domain]",
    "beschrieben_am": "[ISO-Datum]",
    "aktivitaeten": [
      {
        "id": "akt-001",
        "name": "[Name wie vom User bestätigt]",
        "status": "erkannt"
      }
    ]
  }
]
```

### Datenmodell context/prozesse.json

Vollständiges Schema pro Aktivität (nach Tiefenextraktion):

```json
{
  "id": "akt-001",
  "name": "Versand Controlling",
  "status": "erkannt|in-extraktion|extrahiert|validiert",
  "klasse": "A|B|C",
  "trigger": {
    "typ": "zeitbasiert|ereignisbasiert|bedingungsbasiert",
    "beschreibung": "Jeden Werktag morgens"
  },
  "schritte": [
    { "nr": 1, "schritt": "Dashboard öffnen", "system": "Odoo", "details": "VCA Performance" }
  ],
  "systeme": [
    { "name": "Odoo", "genutzt_fuer": "Dashboard, Export", "zugriffspunkt": "Lager-Modul" }
  ],
  "output": {
    "format": "E-Mail",
    "empfaenger": "Logistik-Team",
    "inhalt": "Zusammenfassung offene Aufträge mit Ampelsystem"
  },
  "regeln": [
    { "id": "R1", "beschreibung": "Ampel lieferbar", "wert": ">36h=rot, 24-36h=gelb, <24h=grün", "typ": "schwellwert" }
  ],
  "ausnahmen": [
    { "id": "A1", "sonderfall": "Feiertag", "bedingung": "Kein Versand am Vortag", "aktion": "Vergleich überspringen" }
  ],
  "abhaengigkeiten": {
    "voraussetzungen": "Dashboard-Zugang",
    "nachfolger": "Bestell-Controlling",
    "personen": "VCA Team"
  }
}
```

Bei der prozess-analyse werden nur `id`, `name` und `status: "erkannt"` gesetzt. Die restlichen Felder füllt der `regel-extraktion` Skill.

## Regeln

- Niemals die Beschreibung des Users bewerten oder kommentieren
- Die Sprache des Users für Aktivitätsnamen übernehmen
- Eine Aktivität = eine eigenständige Aufgabe (nicht zu fein, nicht zu grob)
- Sprache: Deutsch
- Duze den User
