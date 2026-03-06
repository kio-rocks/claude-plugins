---
name: vorschlags-engine
description: Scannt alle erfassten Aktivitäten, matcht sie mit verfügbaren Automatisierungs-Patterns und gibt die Top-5 Vorschläge mit konkretem nächsten Schritt aus. Wird ausgelöst durch "Was kann ich automatisieren?", "Zeig mir Vorschläge", "Wo fange ich an?" oder "/vorschlaege". Scannt lokale Aktivitätsdaten und erstellt priorisierte Vorschläge.
---

# Vorschlags-Engine

6-Schritt-Algorithmus: Alle Aktivitäten scannen, Patterns zuordnen, Systemanbindung prüfen, Impact-Effort priorisieren, Top-5 ausgeben. Immer mit konkretem nächsten Schritt.

## Modus-Erkennung

### STANDALONE

```
Datenquelle: context/aktivitaeten.json oder CSV-Upload
Falls keine Daten: "Bitte lade deine aktivitaeten.csv hoch oder starte zuerst die /inventur."
```

---

## Algorithmus

Führe alle 6 Schritte aus `references/matching-algorithmus.md` aus:

### Schritt 1: Aktivitäten scannen

Lade alle Aktivitäten des Users.

Berechne für jede Aktivität einen Kandidaten-Score:

| Kriterium | Punkte |
|-----------|--------|
| Energie = Energiesauger | +3 |
| Status = kein Prozess oder Prozess funktioniert nicht | +2 |
| Status = weil es sonst niemanden gibt | +2 |
| Frequenz = täglich oder wöchentlich | +2 |
| Zeit >= 2 Stunden pro Woche | +1 |
| Quadrant = Mag ich nicht / gut | +2 |

Schwelle: Aktivitäten mit >= 4 Punkten kommen in die Kandidatenliste.

### Schritt 2: Automatisierbarkeit vorab filtern

**Herausfiltern (nicht automatisierbar):**
- Reine Führungs- und Beziehungsarbeit
- Kreative Kernarbeit mit Urteilskraft
- Einmalige Sonderaufgaben (Frequenz jährlich + niedrig)

**Behalten (gut automatisierbar):**
- Wiederkehrende Datentransfers
- Regelmäßige Reports und Benachrichtigungen
- Strukturierte Ein-/Ausgabe-Prozesse
- Kalender- und E-Mail-Management

### Schritt 3: Systemanbindung prüfen

Für jeden Kandidaten prüfen welche Systeme genannt wurden.

Entscheidungsbaum:

```
Aktivität nennt System?
├── Ja: Google Workspace System? (Gmail, Sheets, Calendar, Drive, Docs)
│   ├── Ja → Apps Script Vorschlag (automatisierbar)
│   └── Nein → "Sprich mit deinem KIO-Berater über Integrationsmöglichkeiten"
└── Nein: Allgemeiner Vorschlag basierend auf Pattern
```

### Schritt 4: Pattern zuordnen

Nutze `references/pattern-katalog.md` für vollständige Pattern-Beschreibungen.

Schnell-Mapping:

| Aktivitätsbeschreibung | Pattern |
|------------------------|---------|
| "täglich/wöchentlich senden", "Report schicken" | Scheduled Report |
| "eintragen wenn", "aktualisieren wenn" | Sheet-Automation |
| "auf einen Blick sehen", "Dashboard" | Live-Dashboard |
| "von X nach Y übertragen", "synchronisieren" | Cross-Service |
| "durchführen lassen", "Schritt für Schritt" | Dialog-Assistent |
| "Analyse von", "einmalig auswerten" | Snapshot-Analyse |

### Schritt 5: Impact-Effort priorisieren

**Impact-Score (Summe):**
- Stunden pro Woche gespart: >4h = 5, 2-4h = 4, 1-2h = 3, <1h = 1
- Energie-Gewinn: Energiesauger = +2, Energiegeber = 0
- Status-Verbesserung: Notlösung = +2, Kernrolle = 0

**Effort-Score (Summe):**
- Technische Komplexität: Einfach = 1, Mittel = 2, Komplex = 4
- Setup-Aufwand: Manuell = 1, Script+Anleitung = 2, Mehrstufig = 3

**Priorität = Impact ÷ Effort** — höher ist besser.

Sortiere Kandidatenliste nach Priorität absteigend.

### Schritt 6: Top-5 formulieren

Ausgabe der 5 Vorschläge mit höchster Priorität:

```
# Automatisierungs-Vorschläge für [Name]

Ich habe [Anzahl] Aktivitäten analysiert und [Anzahl Kandidaten] gefunden, die sich für Automatisierung eignen. Hier sind deine Top 5:

---

### Vorschlag 1: [Aktivitätsname] automatisieren

**Warum jetzt?** [1-2 Sätze: Stunden gespart + Energie-Gewinn]
**Pattern:** [Pattern-Name]
**Umsetzung:** [Aufwand]
**Erster Schritt:** [Konkrete nächste Aktion]

---

### Vorschlag 2: [Aktivitätsname] automatisieren
[...]

---

[Vorschläge 3-5 folgen demselben Format]

---

Für welchen Vorschlag soll ich einen Baustein erstellen? Sag einfach "Baustein 1", "Baustein 2" usw. oder nenn die Aktivität.
```

### Wenn weniger als 5 Kandidaten gefunden

Zeige alle gefundenen Kandidaten (auch wenn weniger als 5). Falls 0 Kandidaten:

"Ich habe alle Aktivitäten analysiert und aktuell keine klaren Automatisierungs-Kandidaten gefunden. Das kann bedeuten:
- Die Aktivitäten sind zu komplex für Automatisierung
- Noch zu wenige Aktivitäten erfasst (weniger als 10)

Starte mit `/inventur` um mehr Aktivitäten zu erfassen."

## Regeln

- Immer 6-Schritt-Algorithmus vollständig durchlaufen — nie direkt zur Ausgabe springen
- Jeder Vorschlag muss einen konkreten ersten Schritt haben
- Externe Systeme (nicht Google Workspace) nicht eigenständig vorschlagen
- Sprache: Deutsch
- Duze den User
