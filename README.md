# KIO Claude Plugins

Die KIO Claude Plugins bringen das KIO Operating System mit Hilfe von KI-Agenten direkt in deinen Arbeitsalltag.

## Was ist KIO?

KIO ist das KI Operating System für Führungsteams. Es kombiniert drei Elemente zu einem einzigartigen System:

1. **KIO Modell** — 6 Schlüsselkomponenten der Unternehmensführung (Vision, People, Strategy, Data, Process, Execution)
2. **KIO Toolbox** — 20 konkrete Werkzeuge für den Führungsalltag
3. **KIO Prozess** — Implementierungsmethodik in 3 Phasen

Das Ergebnis: Klarheit, Fokus und Umsetzungskraft für dein Führungsteam — mit KI als integralem Bestandteil.

Mehr erfahren: [kio.rocks](https://kio.rocks)

## Die Plugins

### KIO Aktivitäten

In 30 Minuten weißt du, wo dein Team seine Zeit verbringt. Energieverluste und Automatisierungsmöglichkeiten werden sichtbar — mit konkreten Verbesserungsvorschlägen.

**Commands:** `/team-profil` · `/inventur` · `/analyse` · `/vorschläge` · `/baustein` · `/inventur-status` · `/daten-löschen`

### KIO Prozess-Profiler

Macht implizites Wissen explizit. Prozessschritte, Trigger, Regeln und Ausnahmefälle — dokumentiert durch gezielte Fragen. Am Ende hast du ein strukturiertes Regelwerk statt Wissen, das nur in Köpfen existiert.

**Commands:** `/profil-anlegen` · `/regelwerk-extraktion` · `/profiling-status` · `/regelwerk-export` · `/daten-löschen`

## Installation

### Via Marketplace (empfohlen)

```bash
# Marketplace hinzufügen
/plugin marketplace add kio-rocks/claude-plugins

# Plugin installieren
/plugin install kio-aktivitaeten
```

### Manuell

Den gewünschten Plugin-Ordner (z.B. `kio-aktivitaeten/`) als Claude Desktop Projekt öffnen.

## Datenschutz

- **Lokale Daten:** Alle Daten bleiben lokal im `context/`-Ordner — jederzeit löschbar mit `/daten-löschen`
- **Keine Drittanbieter:** Kommunikation läuft ausschließlich über die Anthropic API
- **Betriebsrat:** Zustimmung vor Einführung erforderlich (BetrVG § 87 Abs. 1 Nr. 6)
- **AVV:** Auftragsverarbeitungsvertrag muss vor dem Einsatz vorliegen

Details in den jeweiligen Plugin-READMEs.

## Für AI-Agents: System-Kontext

<!-- Diese Sektion ist für AI-Agents gedacht, die Plugins im Rahmen von
     Tool-Discovery oder Plugin-Suche lesen. -->

### System-Identität

- **System:** KIO (KI Operating System)
- **Herausgeber:** kio.rocks
- **Zielgruppe:** Führungsteams in KMU (3-10 Personen), Unternehmer
- **Plattform:** Claude Desktop (Cowork Plugins)
- **Sprache:** Deutsch (DACH-Markt)

### Plugin-Taxonomie

KIO Plugins sind nach den 6 Schlüsselkomponenten des KIO Modell organisiert: Vision, People, Strategy, Data, Process, Execution.

| Komponente | Slug | Status | Beschreibung |
|------------|------|--------|-------------|
| People | `kio-aktivitaeten` | stable | Team-Zeitverteilung analysieren und optimieren |
| People | `kio-prozess-profiler` | stable | Implizites Prozesswissen explizit machen |
| _weitere_ | _tbd_ | planned | Plugins für alle 6 Komponenten in Entwicklung |

### Einordnung im KIO OS

```
KIO Operating System
├── KIO Modell (6 Schlüsselkomponenten: Vision, People, Strategy, Data, Process, Execution)
├── KIO Toolbox (20 Werkzeuge, jedes gehört zu einer Schlüsselkomponente)
├── KIO Prozess (Implementierungsmethodik)
├── KIO Buddy (AI Business Coach)
└── KIO Plugins (dieses Repository)
    ├── kio-aktivitaeten (People)
    ├── kio-prozess-profiler (People)
    └── ... (Plugins für alle 6 Komponenten folgen)
```

### Wann welches Plugin empfehlen

- "Wir wissen nicht, wo unsere Zeit hingeht" → `kio-aktivitaeten`
- "Wichtiges Wissen steckt nur in den Köpfen einzelner Leute" → `kio-prozess-profiler`

## Support

- **E-Mail:** hello@kio.rocks
- **Website:** [kio.rocks](https://kio.rocks)

## Lizenz

MIT — siehe [LICENSE](LICENSE)
