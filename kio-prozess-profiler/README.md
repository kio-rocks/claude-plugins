# KIO Prozess-Profiler

Ein Cowork-Plugin für Claude Desktop, das die versteckten Regeln aus Arbeitsprozessen extrahiert: Schwellwerte, Ausnahmen und Entscheidungslogiken, die bisher nur im Kopf der Mitarbeiter existieren.

## Überblick

Jeder Mitarbeiter hat Expertenwissen, das nirgendwo dokumentiert ist: "Ab 36 Stunden wird es kritisch", "Bei Feiertagen mache ich das anders", "Deal-Aktionen haben 35% Zielmarge". Dieses Plugin macht dieses Wissen sichtbar und dokumentiert es strukturiert.

```
Beschreiben --> Extrahieren --> Dokumentieren
```

## Komponenten

### Commands -- Explizite Workflows per Slash-Befehl

| Command | Beschreibung |
|---------|-------------|
| `/profil-anlegen` | Profil anlegen — Mandant und Prozessbereich erfassen für die Analyse |
| `/regelwerk-extraktion` | Regelwerk extrahieren — Prozessregeln systematisch aus Mandantenwissen ableiten |
| `/profiling-status` | Profiling-Fortschritt anzeigen — Status aller Extraktionsschritte auf einen Blick |
| `/regelwerk-export` | Regelwerk exportieren — fertige Prozessregeln als strukturiertes Markdown |
| `/daten-löschen` | Lokale Plugin-Daten löschen — Profil und Prozessdaten DSGVO-konform entfernen |

### Skills -- Domänenwissen das automatisch greift

| Skill | Beschreibung | Trigger-Beispiele |
|-------|-------------|-------------------|
| `prozess-analyse` | Freitext-Beschreibung in Aktivitätenliste umwandeln | "Ich beschreibe mal meinen Arbeitstag", "Mein Prozess sieht so aus" |
| `regel-extraktion` | 6-Dimensionen-Tiefenextraktion pro Aktivität | "Frag mich zu [Aktivität]", "Extrahiere die Regeln" |
| `quality-check` | Vollständigkeits-Validierung gegen Vagheits-Muster | "Ist das vollständig?", "Prüfe die Extraktion" |
| `regelwerk-export` | Export-Formatierung als Markdown-Artifact | "Exportiere das Regelwerk", /regelwerk-export |

### Agent -- Dialoggeführte Extraktion

| Agent | Beschreibung |
|-------|-------------|
| `profiler-coach` | Führt durch strukturierte Tiefeninterviews in 4 Phasen: Begrüßung, Prozess-Aufnahme, Tiefenextraktion, Validierung |

## Setup

### Schritt 1: Plugin in Claude Desktop öffnen

Öffne den `kio-prozess-profiler` Ordner als Claude Desktop Projekt.

### Schritt 2: Profil anlegen

```
/profil-anlegen
```

Legt dein Profil an (Name, Rolle, Team, Prozessbereich). Einmalig notwendig.

## Nutzung

### Erste Extraktions-Session

```
/regelwerk-extraktion
```

Der `profiler-coach` Agent führt dich durch ein strukturiertes Interview:

1. Du beschreibst einen Prozess oder Arbeitsbereich in eigenen Worten
2. Der Agent identifiziert die einzelnen Aktivitäten und bestätigt die Liste mit dir
3. Pro Aktivität werden 6 Dimensionen systematisch durchgefragt: Trigger, Schritte, Systeme, Output, Regeln, Ausnahmen
4. Nach jeder Aktivität wird das extrahierte Regelwerk zur Bestätigung gezeigt

### Fortschritt prüfen

```
/profiling-status
```

Zeigt: X Prozessbereiche, Y Aktivitäten erkannt, Z extrahiert, W validiert. Empfiehlt den nächsten Schritt.

### Regelwerk exportieren

```
/regelwerk-export
```

Formatiert alle validierten Aktivitäten als strukturiertes Markdown-Artifact mit Gesamtübersicht-Tabelle und Detail-Profilen.

## Example Workflows

### Neuen Mandanten anlegen

```
/profil-anlegen
```

Nenne den Mandantennamen und den Prozessbereich. Das Plugin erstellt ein Profil und führt dich durch die ersten Schritte.

### Regelwerk aus Prozessbeschreibung extrahieren

```
/regelwerk-extraktion
```

Beschreibe einen Prozess oder benenne den Bereich. Das Plugin extrahiert systematisch Regeln nach 6 Dimensionen: Trigger, Schritte, Systeme, Output, Regeln/Schwellwerte, Ausnahmen.

### Fortschritt prüfen

```
/profiling-status
```

Zeigt den aktuellen Stand aller Extraktionsschritte — was ist fertig, was fehlt noch.

### Fertiges Regelwerk exportieren

```
/regelwerk-export
```

Exportiert alle validierten Aktivitäten als Copy-Paste-Ready Markdown-Artifact.

### Daten entfernen

```
/daten-löschen
```

Entfernt alle lokalen Plugin-Daten DSGVO-konform. Bestätigungsdialog vor Löschung.

## Datenschutz und Sicherheit

### Datenverarbeitung

Dieses Plugin verarbeitet Eingaben über Claude Desktop (Anthropic, USA). Beachte:

- **Anthropic-Training:** Standardmäßig können Eingaben in Claude für Modell-Training genutzt werden, sofern kein Enterprise-Vertrag mit Zero-Data-Retention besteht. Informiere dich bei deiner IT-Abteilung über den bestehenden Vertrag.
- **Lokale Daten:** Profil und Prozesse werden lokal im `context/`-Ordner gespeichert. Du kannst diese jederzeit mit `/daten-löschen` löschen.
- **Keine externe Übertragung:** Das Plugin sendet keine Daten an Drittanbieter-Server. Die Kommunikation läuft ausschließlich über die Anthropic API.

### Betriebsrat / Mitbestimmung

Dieses Plugin erfasst und dokumentiert Arbeitsprozesse und deren Regeln. In Unternehmen mit Betriebsrat ist dessen Zustimmung **vor** der Einführung erforderlich (BetrVG § 87 Abs. 1 Nr. 6 -- Leistungs- und Verhaltenskontrolle).

### Auftragsverarbeitung

Vor dem Einsatz in deinem Unternehmen muss ein Auftragsverarbeitungsvertrag (AVV) zwischen deinem Unternehmen und KIO vorliegen. Kontaktiere KIO für die Bereitstellung.

### Daten löschen

```
/daten-löschen
```

Löscht alle lokalen Plugin-Daten (Profil, Prozesse). Siehe auch: DSGVO Art. 17 (Recht auf Löschung).
