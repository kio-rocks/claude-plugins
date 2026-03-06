# Matching-Algorithmus: Aktivitäten zu Automatisierungs-Vorschlägen

6-Schritt-Prozess um aus erfassten Aktivitäten konkrete Automatisierungs-Vorschläge zu entwickeln.

## Überblick

```
Schritt 1: Aktivitäten scannen
    ↓
Schritt 2: Automatisierbarkeit vorab filtern
    ↓
Schritt 3: Systemanbindung prüfen
    ↓
Schritt 4: Pattern zuordnen
    ↓
Schritt 5: Impact-Effort priorisieren
    ↓
Schritt 6: Top-5 formulieren
```

---

## Schritt 1: Aktivitäten scannen

**Ziel:** Alle erfassten Aktivitäten lesen und Kandidaten für Automatisierung identifizieren.

**Eingabe:** `context/aktivitaeten.json` oder CSV-Upload

**Scan-Kriterien:**

| Kriterium | Gewichtung | Erklärung |
|---|---|---|
| Energie = "Energiesauger" | +3 Punkte | Kandidat für Automatisierung (lohnt sich subjektiv) |
| Status = "kein Prozess" oder "Prozess funktioniert nicht" | +2 Punkte | Strukturproblem, Automatisierung hilft |
| Status = "weil es sonst niemanden gibt" | +2 Punkte | Ressourcenproblem, Automatisierung entlastet |
| Frequenz = "pro Tag" oder "pro Woche" | +2 Punkte | Häufig = hohe Zeitersparnis durch Automatisierung |
| Zeit >= 2 Stunden pro Woche | +1 Punkt | Signifikanter Zeitaufwand |
| Quadrant = "Mag ich nicht / gut" | +2 Punkte | Klassischer Automatisierungs-Kandidat |

**Schwelle:** Aktivitäten mit >= 4 Punkten kommen in die Kandidatenliste.

---

## Schritt 2: Automatisierbarkeit vorab filtern

**Ziel:** Kandidaten auf technische Automatisierbarkeit prüfen.

**Nicht automatisierbar (herausfiltern):**
- Reine Führungs- und Beziehungsarbeit ("Mitarbeiter-Gespräche führen")
- Kreative Kernarbeit die persönliche Urteilskraft erfordert
- Einmalige Sonderaufgaben (Frequenz "pro Jahr" mit niedrigem Aufwand)

**Gut automatisierbar (behalten):**
- Wiederkehrende Datentransfers (lesen, transformieren, schreiben)
- Regelmäßige Reports und Benachrichtigungen
- Strukturierte Eingabe-/Ausgabe-Prozesse
- Kalender- und E-Mail-Management

---

## Schritt 3: Systemanbindung prüfen

**Ziel:** Für jeden Kandidaten prüfen welche Systeme genannt wurden und welches Delivery-Format passt.

**Entscheidungsbaum:**

```
Aktivität nennt System?
├── Ja: Google Workspace System? (Gmail, Sheets, Calendar, Drive, Docs)
│   ├── Ja → Apps Script Vorschlag (direkt automatisierbar)
│   └── Nein (externes System) → "Sprich mit deinem KIO-Berater"
└── Nein: Allgemeiner Vorschlag basierend auf Pattern
```

**Google Workspace erkannt:** Konkreten Apps Script Vorschlag mit Installations-Anleitung

**Kein System erkannt:** Allgemeinen Vorschlag basierend auf Aktivitäts-Pattern

---

## Schritt 4: Pattern zuordnen

**Ziel:** Jedem Kandidaten ein Automatisierungs-Pattern zuordnen.

Verwende `references/pattern-katalog.md` für vollständige Pattern-Beschreibungen.

**Schnell-Mapping:**

| Aktivitäts-Beschreibung enthält... | Wahrscheinliches Pattern |
|---|---|
| "täglich/wöchentlich senden", "Report schicken", "Zusammenfassung" | Scheduled Report |
| "eintragen wenn", "aktualisieren wenn", "auslösen wenn" | Sheet-Automation |
| "auf einen Blick sehen", "überwachen", "Dashboard" | Live-Dashboard |
| "von X nach Y übertragen", "synchronisieren", "in mehreren Systemen" | Cross-Service |
| "durchführen lassen", "Schritt für Schritt", "begleiten" | Dialog-Assistent |
| "Analyse von", "einmalig auswerten", "visualisieren" | Snapshot-Analyse |

---

## Schritt 5: Impact-Effort priorisieren

**Ziel:** Top-Kandidaten nach Kosten-Nutzen-Verhältnis sortieren.

**Impact-Score (1-5):**

| Faktor | Score |
|---|---|
| Stunden pro Woche gespart (>4h = 5, 2-4h = 4, 1-2h = 3, <1h = 1) | 1-5 |
| Energie-Gewinn (Sauger = +2, Geber = 0) | 0-2 |
| Status-Verbesserung (Notlösung = +2, Rolle = 0) | 0-2 |

**Effort-Score (1-5):**

| Faktor | Score |
|---|---|
| Technische Komplexität (Einfach = 1, Mittel = 2, Komplex = 4) | 1-4 |
| Setup-Aufwand (Manuell = 1, Script+Anleitung = 2, Multi-System = 3) | 1-3 |

**Priorität = Impact ÷ Effort** (höher = besser)

---

## Schritt 6: Top-5 formulieren

**Ziel:** Die 5 vielversprechendsten Vorschläge klar kommunizieren.

**Ausgabe-Format pro Vorschlag:**

```
### Vorschlag X: [Aktivitäts-Name] automatisieren

**Warum jetzt?** [1-2 Sätze: Impact-Begründung]
**Pattern:** [Pattern-Name aus pattern-katalog.md]
**Umsetzung:** [Geschätzter Setup-Aufwand]
**Erster Schritt:** [Konkrete nächste Aktion]
```

**Reihenfolge:** Nach Priorität (Schritt 5), höchste zuerst.

**Abschluss:** "Für welchen Vorschlag soll ich direkt einen Baustein erstellen? Sag einfach die Nummer."
