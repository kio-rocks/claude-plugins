# KIO Automatisierungs-Plugins

Plugins für Claude Code und Claude Desktop, die Team-Aktivitäten erfassen, analysieren und in konkrete Automatisierungen umsetzen.

## Installation

### Via Marketplace (empfohlen)

```bash
# Marketplace hinzufügen
/plugin marketplace add kio-rocks/automation-plugins

# Plugin installieren
/plugin install kio-aktivitaeten@kio-automation
```

### Manuell (Claude Desktop)

Den gewünschten Plugin-Ordner (z.B. `kio-aktivitaeten/`) als Claude Desktop Projekt öffnen.

## Verfügbare Plugins

| Plugin | Beschreibung | Commands |
|--------|-------------|----------|
| **kio-aktivitaeten** | Erfasse Team-Aktivitäten und entwickle konkrete Automatisierungen | `/team-profil`, `/inventur`, `/analyse`, `/vorschlaege`, `/baustein`, `/inventur-status`, `/daten-löschen` |
| **kio-prozess-profiler** | Extrahiere versteckte Prozessregeln durch strukturierte Interviews | `/profil-anlegen`, `/regelwerk-extraktion`, `/profiling-status`, `/regelwerk-export`, `/daten-löschen` |

## Plugin-Details

### kio-aktivitaeten

Wo verbringt dein Team die meiste Zeit? Was kostet Energie? Was könnte automatisiert werden? Dieses Plugin hilft dir, Antworten zu finden und direkt in handlungsfertige Bausteine umzusetzen.

```
Inventur → Analyse → Vorschläge → Bausteine
```

**Workflow:**
1. `/team-profil` — Team-Profil anlegen (einmalig)
2. `/inventur` — 30-Minuten geführte Erfassung aller Team-Tätigkeiten
3. `/analyse` — Dashboard mit 7 Dimensionen (Zeit, Energie, Automatisierung)
4. `/vorschlaege` — Top 5 Automatisierungsvorschläge mit Aufwand/Nutzen
5. `/baustein` — Fertige Anleitung mit Tools und Zeitersparnis

### kio-prozess-profiler

Jeder Mitarbeiter hat Expertenwissen, das nirgendwo dokumentiert ist. Dieses Plugin macht es sichtbar: Schwellwerte, Ausnahmen, Entscheidungslogiken.

```
Beschreiben → Extrahieren → Dokumentieren
```

**Workflow:**
1. `/profil-anlegen` — Mandant und Prozessbereich erfassen (einmalig)
2. `/regelwerk-extraktion` — Strukturiertes Tiefeninterview in 4 Phasen
3. `/profiling-status` — Fortschritt aller Extraktionsschritte
4. `/regelwerk-export` — Fertige Prozessregeln als strukturiertes Markdown

## Datenschutz

- **Lokale Daten:** Profil- und Prozessdaten werden lokal im `context/`-Ordner gespeichert und können jederzeit mit `/daten-löschen` entfernt werden.
- **Keine externe Übertragung:** Plugins senden keine Daten an Drittanbieter. Die Kommunikation läuft ausschließlich über die Anthropic API.
- **Betriebsrat:** In Unternehmen mit Betriebsrat ist dessen Zustimmung vor Einführung erforderlich (BetrVG § 87 Abs. 1 Nr. 6).
- **AVV:** Vor dem Einsatz muss ein Auftragsverarbeitungsvertrag (AVV) vorliegen.

Details in den jeweiligen Plugin-READMEs.

## Support

- **E-Mail:** hello@kio.rocks
- **Website:** [kio.rocks](https://kio.rocks)

## Lizenz

MIT — siehe [LICENSE](LICENSE)
