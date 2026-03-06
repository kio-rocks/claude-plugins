# KIO Claude Plugins

KIO Claude Plugins sind KI-gestützte Werkzeuge für Claude Desktop, die Führungsteams helfen, Klarheit zu schaffen, Strukturen aufzubauen und operative Exzellenz zu erreichen.

## Was ist KIO?

KIO ist ein KI Operating System für Unternehmer und ihre Führungsteams. Es verbindet ein bewährtes Framework für Unternehmensführung mit KI-Agents, die Teams beim Denken, Planen und Umsetzen unterstützen.

Diese Plugins sind Teil des KIO-Ökosystems. Jedes Plugin adressiert eine konkrete Herausforderung, der Führungsteams im Alltag begegnen — von "Wo geht unsere Zeit eigentlich hin?" bis "Welche Regeln stecken in unseren Köpfen, aber nirgendwo auf Papier?"

Die Plugins funktionieren eigenständig in Claude Desktop. Für das volle KIO-Erlebnis mit KIO Buddy und strategischer Begleitung: [kio.rocks](https://kio.rocks)

## Plugins

KIO Plugins sind entlang der 6 Schlüsselkomponenten des KIO Modell organisiert. Jede Komponente adressiert einen Aspekt der Unternehmensführung — und jedes Plugin hilft, diesen Aspekt konkret umzusetzen.

| Komponente | Plugin | Was es löst |
|------------|--------|-------------|
| **Vision** | _In Entwicklung_ | — |
| **People** | [KIO Aktivitäten](#kio-aktivitäten) | Verstehen, wo die Zeit des Teams wirklich hingeht |
| **People** | [KIO Prozess-Profiler](#kio-prozess-profiler) | Versteckte Regeln und Expertenwissen sichtbar machen |
| **Strategy** | _In Entwicklung_ | — |
| **Data** | _In Entwicklung_ | — |
| **Process** | _In Entwicklung_ | — |
| **Execution** | _In Entwicklung_ | — |

### KIO Aktivitäten

Wo verbringt dein Team die meiste Zeit? Was kostet Energie? Was könnte automatisiert werden? Dieses Plugin begleitet dich von der ersten Bestandsaufnahme bis zum fertigen Automatisierungs-Baustein.

**So funktioniert es:** In einer geführten 30-Minuten-Session erfasst du die Aktivitäten deines Teams. Das Plugin analysiert Zeitverteilung, Energielevel und Automatisierungspotenzial und generiert konkrete, umsetzbare Verbesserungsvorschläge.

**Commands:** `/team-profil` · `/inventur` · `/analyse` · `/vorschläge` · `/baustein` · `/inventur-status` · `/daten-löschen`

### KIO Prozess-Profiler

Jeder Mitarbeiter hat Expertenwissen, das nirgendwo dokumentiert ist: "Ab 36 Stunden wird es kritisch", "Bei Feiertagen mache ich das anders". Dieses Plugin macht dieses Wissen sichtbar.

**So funktioniert es:** Du beschreibst einen Prozess in deinen eigenen Worten. Das Plugin identifiziert die einzelnen Aktivitäten und stellt gezielte Fragen zu Triggern, Schritten, Systemen, Regeln und Ausnahmen. Am Ende hast du ein strukturiertes Regelwerk.

**Commands:** `/profil-anlegen` · `/regelwerk-extraktion` · `/profiling-status` · `/regelwerk-export` · `/daten-löschen`

## Installation

### Via Marketplace (empfohlen)

```bash
# Marketplace hinzufügen
/plugin marketplace add kio-rocks/claude-plugins

# Plugin installieren
/plugin install kio-aktivitaeten
```

### Manuell (Claude Desktop)

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

### Ökosystem-Einordnung

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
- "Wir brauchen bessere Quartalsziele" → in Entwicklung

## Support

- **E-Mail:** hello@kio.rocks
- **Website:** [kio.rocks](https://kio.rocks)

## Lizenz

MIT — siehe [LICENSE](LICENSE)
