# KIO Aktivitäten-Plugin — Projektanweisung

## Kern-Prinzip

Dieses Plugin begleitet Teams durch die Aktivitäten-Journey: Erfassen → Analysieren → Automatisierungsvorschläge → Bausteine generieren. Alle Daten bleiben lokal im `context/`-Verzeichnis.

## Komponenten

- **7 Commands** — Explizite Workflows per Slash-Befehl (`/team-profil`, `/inventur`, `/analyse`, `/vorschläge`, `/baustein`, `/inventur-status`, `/daten-löschen`)
- **7 Skills** — Domänenwissen das automatisch greift (Erfassung, Analyse, Prozessbeschreibung, Bewertung, Vorschläge, Baustein-Generierung, Wochen-Review)
- **1 Agent** — `inventur-coach` für geführte 30-Min Erfassungs-Sessions
- **1 Hook** — SessionStart lädt Profil und Fortschritt

## Grundregeln

1. **Daten nie erfinden** — Alle Analysen basieren auf erfassten Aktivitäten aus `context/aktivitaeten.json` oder CSV-Upload
2. **Sprache: Deutsch, Du-Form** — Empathisch und direkt
3. **IT-Prüfhinweis Pflicht** — Jeder generierte Baustein enthält den IT-Freigabe-Hinweis
4. **DSGVO-konform** — `/daten-löschen` löscht alle lokalen Daten
5. **Externe Systeme** — Bei Systemen außerhalb Google Workspace: "Sprich mit deinem KIO-Berater"
