# KIO Aktivitäten-Plugin

Ein Cowork-Plugin für Claude Desktop, das die komplette Aktivitäten-Journey begleitet: Erfassen, Analysieren, Automatisierungen vorschlagen, konkrete Bausteine generieren.

## Überblick

Wo verbringt dein Team die meiste Zeit? Was kostet Energie? Was könnte automatisiert werden? Dieses Plugin hilft dir, Antworten zu finden und direkt in handlungsfertige Bausteine umzusetzen.

```
Inventur → Analyse → Vorschläge → Bausteine
```

## Komponenten

### Commands — Explizite Workflows per Slash-Befehl

| Command | Beschreibung |
|---------|-------------|
| `/team-profil` | Team-Profil anlegen — Branche, Teamgröße und Arbeitsstil erfassen |
| `/inventur` | Aktivitäten-Inventur starten — 30-Minuten geführte Erfassung aller Team-Tätigkeiten |
| `/analyse` | Analyse-Dashboard — Zeitverteilung, Energielevel und Automatisierungspotenzial auf einen Blick |
| `/vorschlaege` | Automatisierungsvorschläge — Top 5 Verbesserungen mit Aufwand-Nutzen-Analyse |
| `/baustein` | Automatisierungs-Baustein generieren — fertige Anleitung mit Tools und Zeitersparnis |
| `/inventur-status` | Inventur-Fortschritt anzeigen — erfasste Aktivitäten, offene Bereiche, nächste Schritte |
| `/daten-löschen` | Lokale Daten löschen — Profil und Aktivitätsdaten DSGVO-konform entfernen |

### Skills — Domänenwissen das automatisch greift

| Skill | Beschreibung | Trigger-Beispiele |
|-------|-------------|-------------------|
| `aktivitaeten-erfassen` | Einzelne Aktivität im Dialog aufnehmen | "Ich mache...", "Neue Aktivität" |
| `aktivitaeten-analyse` | 7-Dimensionen-Dashboard aus CSV-Daten | "Analysiere meine Aktivitäten" |
| `prozess-beschreiben` | Prozess einer Aktivität strukturieren | "Wie läuft das ab?", "Beschreib den Prozess" |
| `vorschlags-engine` | Dual-Mode: Einzelbewertung oder Top-5 Batch-Vorschläge | "Kann man das automatisieren?", "Was kann ich automatisieren?" |
| `baustein-generator` | Fertigen Baustein in passendem Format erstellen | "Bau mir das", "Erstelle den Baustein" |
| `wochen-review` | Wöchentlicher Fortschrittsbericht | "Wie läuft's?", "Wochen-Update" |

### Agent — Dialoggeführte Erfassung

| Agent | Beschreibung |
|-------|-------------|
| `inventur-coach` | Führt durch eine strukturierte 30-Min Aktivitäts-Inventur in 4 Phasen |

## Example Workflows

### Erste Aktivitäten-Inventur
```
/team-profil
```
Erstelle zuerst ein Team-Profil mit Branche und Teamgröße. Dann:
```
/inventur
```
Die geführte 30-Minuten-Inventur erfasst systematisch alle Aktivitäten deines Teams.

### Automatisierungspotenzial entdecken
```
/analyse
```
Zeigt die 7 Analyse-Dimensionen: Zeitverteilung, Energielevel, Automatisierungseignung und mehr.
```
/vorschlaege
```
Basierend auf der Analyse: Top 5 konkrete Automatisierungsvorschläge mit Aufwand/Nutzen.

### Automatisierung umsetzen
```
/baustein Vorschlag-ID
```
Generiert eine fertige Schritt-für-Schritt-Anleitung mit Tool-Empfehlungen und erwarteter Zeitersparnis.

## Setup

### Schritt 1: Plugin in Claude Desktop öffnen

Öffne den `kio-aktivitaeten` Ordner als Claude Desktop Projekt.

### Schritt 2: Profil anlegen

```
/team-profil
```

Legt dein Profil an (Name, Rolle, Team, Systeme). Einmalig notwendig.

## Nutzung

### Erste Aktivitäts-Inventur

```
/inventur
```

Der `inventur-coach` Agent führt dich in ~30 Minuten durch eine strukturierte Erfassung aller Team-Aktivitäten. Ergebnis: `context/aktivitaeten.json` mit allen Aktivitäten.

### Aktivitäten analysieren

```
/analyse
```

Lädt deine Aktivitäten (aus `context/aktivitaeten.json` oder CSV-Upload) und erstellt ein Dashboard mit 7 Dimensionen: Zeitverteilung, Energie-Bilanz, Frequenz-Matrix, Wert-Aufwand-Verhältnis, Automatisierungs-Kandidaten, Bottlenecks, Empfehlungen.

### Vorschläge generieren

```
/vorschlaege
```

Nutzt deine Analyse um die Top-5 Automatisierungsvorschläge zu identifizieren — gerankt nach Impact/Effort-Verhältnis, mit Angabe des passenden Delivery-Formats.

### Baustein erstellen

```
/baustein [Aktivität oder Vorschlags-ID]
```

Generiert einen fertigen, einsatzbereiten Baustein im passenden Format:
- **Apps Script**: Wenn Google Workspace-Automatisierung
- **Claude Skill ZIP**: Wenn KI-gestützter Prozess mit Claude Desktop
- **Artifact**: Wenn Template oder Dashboard
- **Konfigurations-Anleitung**: Wenn Schritt-für-Schritt Einrichtung

### Fortschritt verfolgen

```
/inventur-status
```

Zeigt Überblick: X Aktivitäten erfasst, Y analysiert, Z Vorschläge offen, A Bausteine erstellt.

## Datenschutz und Sicherheit

### Datenverarbeitung

Dieses Plugin verarbeitet Eingaben über Claude Desktop (Anthropic, USA). Beachte:

- **Anthropic-Training:** Standardmäßig können Eingaben in Claude für Modell-Training genutzt werden, sofern kein Enterprise-Vertrag mit Zero-Data-Retention besteht. Informiere dich bei deiner IT-Abteilung über den bestehenden Vertrag.
- **Lokale Daten:** Profil und Aktivitäten werden lokal im `context/`-Ordner gespeichert. Du kannst diese jederzeit mit `/daten-löschen` entfernen.
- **Keine externe Übertragung:** Das Plugin sendet keine Daten an Drittanbieter-Server. Die Kommunikation läuft ausschließlich über die Anthropic API.

### Betriebsrat / Mitbestimmung

Dieses Plugin erfasst und analysiert Arbeitsaktivitäten. In Unternehmen mit Betriebsrat ist dessen Zustimmung **vor** der Einführung erforderlich (BetrVG § 87 Abs. 1 Nr. 6 — Leistungs- und Verhaltenskontrolle).

### Auftragsverarbeitung

Vor dem Einsatz in deinem Unternehmen muss ein Auftragsverarbeitungsvertrag (AVV) zwischen deinem Unternehmen und KIO vorliegen. Kontaktiere KIO für die Bereitstellung.

### Daten löschen

```
/daten-löschen
```

Löscht alle lokalen Plugin-Daten (Profil, Aktivitäten, Analysen). Siehe auch: DSGVO Art. 17 (Recht auf Löschung).
