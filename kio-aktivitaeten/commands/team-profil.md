---
description: "Team-Profil anlegen — Branche, Teamgröße und Arbeitsstil erfassen"
argument-hint: "<Teamname oder Branche>"
allowed-tools: ["Read", "Write"]
---

```
┌─────────────────────────────────────────────────────────┐
│                      TEAM-PROFIL                        │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Interaktiver Dialog: Name, Rolle, Team, Systeme     │
│  ✓ Branche und Teamgröße erfassen                      │
│  ✓ Schreibt context/profil.json                        │
│  ✓ Empfiehlt nächsten Schritt (/inventur)              │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + HR-System: Teamdaten automatisch importieren         │
│  + Org-Chart: Rolle und Berichtslinien ableiten         │
│  + IT-Inventar: Genutzte Systeme automatisch erkennen   │
└─────────────────────────────────────────────────────────┘
```

# /team-profil

Lege dein Profil an. Einmalig notwendig — danach kennt das Plugin deinen Kontext und alle anderen Commands funktionieren gezielter.

## Was ich brauche

**Option A: Geführter Dialog**
Ich stelle dir systematisch Fragen zu deinem Team und deiner Rolle — Schritt für Schritt.

**Option B: Freitext-Beschreibung**
Beschreibe dich kurz: "Ich bin Max, Teamleiter Operations bei einem Logistik-Unternehmen, 8 Leute im Team, wir nutzen Gmail, Sheets und SAP."

---

## Dialog-Schritte (Standalone)

Ich stelle dir vier Fragen:

### 1. Name
"Wie heißt du?" — Vorname reicht, Nachname optional.

### 2. Rolle
"Was ist deine Rolle?" — Z.B. "Teamleiterin Vertrieb", "Projektmanager", "Assistenz der Geschäftsführung".

### 3. Team
"In welchem Team oder Bereich arbeitest du?" — Z.B. "Marketing", "Operations", "Finance", "Kundenservice".

### 4. Systeme
"Welche digitalen Systeme nutzt du täglich?" — Z.B. "Gmail, Google Calendar, HubSpot, Slack, Excel". Kein System vergessen, auch interne Tools sind wichtig.

---

## Output-Template

Nach dem Dialog schreibe ich `context/profil.json`:

```json
{
  "name": "Max Mustermann",
  "rolle": "Teamleiter Operations",
  "team": "Operations",
  "systeme": ["Gmail", "Google Calendar", "Google Sheets", "Slack", "SAP"],
  "erstellt": "2026-02-23",
  "aktualisiert": "2026-02-23"
}
```

Und zeige eine Bestätigung mit Datenschutzhinweis:

```
Profil gespeichert

Name:     Max Mustermann
Rolle:    Teamleiter Operations
Team:     Operations
Systeme:  Gmail, Google Calendar, Google Sheets, Slack, SAP

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Hinweis zur Datenverarbeitung:

Deine Eingaben werden über Claude Desktop (Anthropic, USA) verarbeitet.
Anthropic kann Eingaben für Modell-Training nutzen, sofern kein
Enterprise-Vertrag mit Zero-Data-Retention besteht. Informiere dich
bei deiner IT-Abteilung über den bestehenden Vertrag.

Dein Profil und deine Aktivitäten werden lokal gespeichert.
Du kannst alle Daten jederzeit mit /daten-löschen entfernen.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Nächster Schritt: /inventur
Starte eine geführte 30-Minuten-Session um deine Team-Aktivitäten zu erfassen.
```

---

## Profil aktualisieren

Einfach erneut `/team-profil` aufrufen — ich frage ob du das bestehende Profil überschreiben möchtest.

