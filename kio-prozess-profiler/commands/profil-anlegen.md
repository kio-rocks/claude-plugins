---
description: "Profil anlegen — Mandant und Prozessbereich erfassen für die Analyse"
argument-hint: "<Mandantenname oder Prozessbereich>"
allowed-tools: ["Read", "Write"]
---

┌─────────────────────────────────────────────────────────┐
│                    PROFIL ANLEGEN                        │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Interaktiver Dialog: Name, Rolle, Team, Bereich     │
│  ✓ Profil als context/profil.json speichern             │
│  ✓ Datenschutzhinweis anzeigen                          │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + CRM-Connector: Mandantendaten automatisch laden      │
│  + Team-Verzeichnis: Rollen und Bereiche vorschlagen    │
└─────────────────────────────────────────────────────────┘

# /profil-anlegen

Lege dein Profil an. Einmalig notwendig -- danach kennt das Plugin deinen Kontext und alle anderen Commands funktionieren gezielter.

## Was ich brauche

**Option A: Mandantenname nennen**
Nenne den Mandanten oder dein Unternehmen: "RidersDeal" oder "Mustermann GmbH"

**Option B: Frei beschreiben**
Beschreibe deine Situation: "Ich bin Teamleiterin Logistik bei einem Sportartikel-Versender und möchte unsere Prozesse dokumentieren"

---

## Ablauf

### Dialog-Schritte

Ich stelle dir vier Fragen:

#### 1. Name
"Wie heißt du?" -- Vorname reicht, Nachname optional.

#### 2. Rolle
"Was ist deine Rolle?" -- Z.B. "Teamleiterin Logistik", "Sachbearbeiter Einkauf", "Assistenz der Geschäftsführung".

#### 3. Team
"In welchem Team oder Bereich arbeitest du?" -- Z.B. "Logistik", "Sales", "Kundenservice", "Einkauf".

#### 4. Prozessbereich
"Welchen Prozessbereich möchtest du als erstes dokumentieren?" -- Z.B. "Logistik Tagesgeschäft", "Kundenservice Retouren", "Sales Preiskalkulation". Das hilft mir, die richtigen Fragen zu stellen.

---

## Ergebnis

Nach dem Dialog schreibe ich `context/profil.json`:

```json
{
  "name": "{{Name}}",
  "rolle": "{{Rolle}}",
  "team": "{{Team}}",
  "prozessbereich": "{{Prozessbereich}}",
  "erstellt": "{{Datum}}",
  "aktualisiert": "{{Datum}}"
}
```

Und zeige eine Bestätigung mit Datenschutzhinweis:

```
Profil gespeichert

Name:            {{Name}}
Rolle:           {{Rolle}}
Team:            {{Team}}
Prozessbereich:  {{Prozessbereich}}

Hinweis zur Datenverarbeitung:

Deine Eingaben werden über Claude Desktop (Anthropic, USA) verarbeitet.
Anthropic kann Eingaben für Modell-Training nutzen, sofern kein
Enterprise-Vertrag mit Zero-Data-Retention besteht. Informiere dich
bei deiner IT-Abteilung über den bestehenden Vertrag.

Dein Profil und deine Prozessdaten werden lokal gespeichert.
Du kannst alle Daten jederzeit mit /daten-löschen löschen.

Nächster Schritt: /regelwerk-extraktion
Starte eine Interview-Session um die Regeln aus deinen Prozessen zu extrahieren.
```

---

## Profil aktualisieren

Einfach erneut `/profil-anlegen` aufrufen -- ich frage ob du das bestehende Profil überschreiben möchtest.
