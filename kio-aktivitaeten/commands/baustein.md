---
description: "Automatisierungs-Baustein generieren — fertige Anleitung mit Tools und Zeitersparnis"
argument-hint: "<Vorschlags-ID oder Aktivitätsname>"
allowed-tools: ["Read", "Write"]
---

```
┌─────────────────────────────────────────────────────────┐
│              AUTOMATISIERUNGS-BAUSTEIN                   │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Liest Aktivität aus context/ oder Freitext          │
│  ✓ Bestimmt passendes Delivery-Format                  │
│  ✓ Generiert vollständigen, einsatzbereiten Baustein   │
│  ✓ Setup-Anleitung in 3 Schritten                      │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + API-Check: Verfügbare Schnittstellen automatisch     │
│  + Deployment: Baustein direkt installieren             │
│  + Monitoring: Zeitersparnis nach Go-Live messen        │
└─────────────────────────────────────────────────────────┘
```

# /baustein

Generiere einen fertigen, einsatzbereiten Automatisierungs-Baustein für eine Aktivität aus deiner Inventur. Das Ergebnis ist direkt verwendbar — kein weiterer Programmieraufwand nötig.

## Was ich brauche

**Option A: Vorschlags-ID aus /vorschlaege**
`/baustein #1` — ich nehme den ersten Vorschlag und generiere den Baustein.

**Option B: Aktivitätsname**
`/baustein Wochenbericht` — ich suche die Aktivität in deinen Inventur-Daten.

**Option C: Freie Beschreibung**
Beschreibe was du automatisieren möchtest: "Ich möchte den wöchentlichen KPI-Bericht aus Google Sheets automatisch per Mail versenden."

---

## Delivery-Formate

### Apps Script
**Wann:** Aktivität nutzt Google Workspace (Gmail, Sheets, Calendar, Docs, Drive).
**Was du bekommst:** Fertiger JavaScript-Code für den Script-Editor + Schritt-für-Schritt Setup-Anleitung.

**Setup:** Code kopieren → Google Apps Script öffnen → Einfügen → Trigger setzen → Fertig.

---

### Claude Skill ZIP
**Wann:** KI-gestützter Prozess der in Claude Desktop läuft.
**Was du bekommst:** `SKILL.md` mit Frontmatter, Trigger-Phrases, vollständiger Anleitung + Verpackungs-Anweisung.

**Setup:** Skill-Ordner erstellen → SKILL.md einfügen → Als Projekt in Claude Desktop öffnen.

---

### Artifact
**Wann:** Template, Dashboard oder strukturiertes Dokument.
**Was du bekommst:** Fertige HTML/Markdown-Vorlage zum direkten Verwenden oder Ausfüllen.

**Beispiele:**
- Meeting-Protokoll-Vorlage (Markdown mit Platzhaltern)
- KPI-Dashboard (HTML mit Visualisierungen)
- Checkliste (Markdown mit Checkboxen)

---

### Anleitung
**Wann:** Komplexe Integration oder Konfiguration.
**Was du bekommst:** Schritt-für-Schritt Anleitung mit allen Einstellungen, Filtern und Regeln.

**Beispiele:**
- Gmail-Filter-Regeln mit Labels
- CRM-Workflow-Konfiguration
- Zapier/Make-Automations-Setup

---

## Output-Template

```
Baustein: Wochenbericht

Format: Apps Script
Datei:  wochenbericht.gs

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Was dieser Baustein macht:
Liest KPI-Daten aus deiner Google Sheets Tabelle, formatiert
einen strukturierten Wochenbericht und mailt ihn automatisch
jeden Montag an dich und dein Team.

Voraussetzungen:
- Google Sheets Tabelle mit KPI-Daten
- Google Apps Script Zugang (kostenlos)
- Gmail-Konto

Zeitersparnis: ~2h/Woche → ~10 Min (93% Reduktion)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Vollständiger Code / Skill / Template folgt hier]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

WICHTIG: Prüfung durch IT-Abteilung
Dieser Code wurde von einer KI generiert. Bitte lass ihn
von deiner IT-Abteilung prüfen, bevor du ihn in Google
Apps Script oder einem anderen System deployst.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Setup in 3 Schritten:

1. Code anpassen
   → Zeile 6: Deine Google Sheets ID eintragen
   → Zeile 7: Deine E-Mail eintragen

2. In Apps Script einfügen
   → sheets.google.com → Erweiterungen → Apps Script
   → Code einfügen → Speichern

3. Trigger setzen
   → Uhren-Symbol links → Trigger hinzufügen
   → Funktion: erstelleWochenbericht
   → Zeitbasiert: Jede Woche, Montag, 07:00 Uhr
```

---

## IT-Prüfhinweis (Pflicht)

Jeder generierte Baustein MUSS den folgenden Warnhinweis enthalten — direkt vor der Setup-Anleitung:

```
WICHTIG: Prüfung durch IT-Abteilung
Dieser Code wurde von einer KI generiert. Bitte lass ihn
von deiner IT-Abteilung prüfen, bevor du ihn in Google
Apps Script oder einem anderen System deployst.
```

Dieser Hinweis ist nicht optional. Er erscheint bei Apps Script, Skill ZIPs und Konfigurations-Anleitungen. Bei Artifacts (HTML-Dashboards) erscheint er als Fußzeile.

