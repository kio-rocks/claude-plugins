---
name: vorschlags-engine
description: Dual-Mode Automatisierungs-Engine. BATCH-Modus scannt alle Aktivitäten und gibt Top-5 Vorschläge. EINZEL-Modus bewertet eine einzelne Aktivität auf Automatisierbarkeit mit Score und Delivery-Format. Wird ausgelöst durch "Was kann ich automatisieren?", "Zeig mir Vorschläge", "Wo fange ich an?", "/vorschlaege", "Kann man das automatisieren?", "Ist das machbar?", "Was kostet das ungefähr?" oder wenn eine spezifische Aktivität bewertet werden soll.
---

# Vorschlags-Engine

Dual-Mode: BATCH (alle Aktivitäten scannen → Top-5) oder EINZEL (eine Aktivität bewerten → Score + Delivery-Format). Immer mit konkretem nächsten Schritt.

## Modus-Erkennung

**EINZEL-Modus** wenn:
- User eine bestimmte Aktivität nennt ("Kann man [X] automatisieren?", "Bewerte [X]")
- User nach Machbarkeit oder Kosten einer einzelnen Aktivität fragt
- → Springe zu **Einzelbewertung**

**BATCH-Modus** wenn:
- User nach allgemeinen Vorschlägen fragt ("Was kann ich automatisieren?", "/vorschlaege")
- Kein spezifischer Aktivitätsname genannt
- → Springe zu **Batch-Algorithmus**

### STANDALONE

```
Datenquelle: context/aktivitaeten.json oder CSV-Upload
Falls keine Daten: "Bitte lade deine aktivitaeten.csv hoch oder starte zuerst die /inventur."
```

---

## Einzelbewertung

Bewertet EINE Aktivität: Automatisierbarkeits-Score, Delivery-Format, Aufwand, Voraussetzungen.

### Schritt E1: Aktivität identifizieren

- Aus Konversation: User hat Aktivitätsname oder -ID genannt
- Aus `context/aktivitaeten.json`: Nach ID oder Name suchen
- Wenn unklar: "Welche Aktivität soll ich bewerten?"

### Schritt E2: Automatisierbarkeits-Score berechnen (1-10)

| Faktor | Max. Punkte | Kriterien |
|--------|-------------|-----------|
| Wiederholbarkeit | 3 | 3=immer gleich, 2=meist gleich, 1=variabel, 0=jedes Mal anders |
| Systemanbindung | 3 | 3=nur Google Workspace, 2=GW+1 extern, 1=extern mit API, 0=keine |
| Datenstruktur | 2 | 2=strukturiert (Sheet), 1=halb-strukturiert, 0=Freitext/Papier |
| Zeit-Impact | 2 | 2= >2h/Woche, 1=0.5-2h/Woche, 0= <0.5h/Woche |

Score: 8-10=Hoch, 5-7=Mittel, 1-4=Gering.

### Schritt E3: Delivery-Format bestimmen

Nutze `references/matching-algorithmus.md` Schritt 3+4 und die Entscheidungsmatrix aus `shared/entscheidungsmatrix.md`.

### Schritt E4: Bewertungs-Report ausgeben

```
# Automatisierungs-Bewertung: [Aktivitätsname]

## Score: [X]/10 — [Hoch/Mittel/Gering]

| Faktor | Punkte | Begründung |
|--------|--------|------------|
| Wiederholbarkeit | [0-3] | [Begründung] |
| Systemanbindung | [0-3] | [Begründung] |
| Datenstruktur | [0-2] | [Begründung] |
| Zeit-Impact | [0-2] | [Begründung] |

## Empfohlenes Format: [Format]

**Zeitersparnis:** Aktuell [X] h/Woche → nach Automatisierung ~[X×0.3] h/Woche
**Aufwand:** [Einmalig X Stunden]
**Amortisation:** Nach [X] Wochen rentabel

## Nächster Schritt
[Konkreter Handlungsvorschlag: "Sage '/baustein [Name]' um den Baustein zu generieren"]
```

Bei Score < 4: Ehrlich kommunizieren dass Aufwand > Nutzen.
Bei externen Systemen außerhalb Google Workspace: "Sprich mit deinem KIO-Berater".

---

## Batch-Algorithmus

Führe alle 6 Schritte aus `references/matching-algorithmus.md` aus:

### Schritt 1: Aktivitäten scannen

Lade alle Aktivitäten des Users.

Berechne für jede Aktivität einen Kandidaten-Score:

| Kriterium | Punkte |
|-----------|--------|
| Energie = `negativ` | +3 |
| Status = `kein-prozess` oder `prozess-defekt` | +2 |
| Status = `sonst-niemand` | +2 |
| Frequenz = `täglich` oder `wöchentlich` | +2 |
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
- Energie-Gewinn: `negativ` = +2, `positiv` = 0
- Status-Verbesserung: Notlösung (`sonst-niemand`/`kein-prozess`/`prozess-defekt`) = +2, `rolle` = 0

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
