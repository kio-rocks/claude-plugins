---
description: "Lokale Daten löschen — Profil und Aktivitätsdaten DSGVO-konform entfernen"
argument-hint: "<'alle' oder Profilname>"
allowed-tools: ["Read", "Write", "Bash"]
---

```
┌─────────────────────────────────────────────────────────┐
│                    DATEN LÖSCHEN                        │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Löscht alle context/*.json Dateien                  │
│  ✓ Bestätigung vor dem Löschen (Pflicht)               │
│  ✓ Detaillierte Lösch-Bestätigung pro Datei            │
│  ✓ DSGVO Art. 17 konform                               │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Cloud-Storage: Auch remote gespeicherte Daten lösch. │
│  + Audit-Log: Löschnachweis für Compliance              │
│  + Team-Admin: Daten einzelner Teammitglieder entfern.  │
└─────────────────────────────────────────────────────────┘
```

# /daten-löschen

Lösche alle lokalen Daten, die dieses Plugin gespeichert hat. Entspricht dem DSGVO-Löschrecht (Art. 17).

## Was ich brauche

**Option A: Alles löschen**
Sage einfach `/daten-löschen alle` — ich frage einmal nach Bestätigung und lösche dann alles.

**Option B: Gezielt**
Sage z.B. `/daten-löschen Profil` — ich lösche nur die Profildaten und lasse den Rest bestehen.

---

## Was gelöscht wird

| Datei | Inhalt |
|-------|--------|
| `context/profil.json` | Dein Profil (Name, Rolle, Team, Systeme) |
| `context/aktivitaeten.json` | Alle erfassten Aktivitäten |
| `context/analyse.json` | Analyse-Ergebnisse |
| `context/vorschlaege.json` | Generierte Automatisierungsvorschläge |
| `context/bausteine.json` | Erstellte Bausteine-Übersicht |
| `context/fortschritt.json` | Fortschritts-Tracking |

---

## Lösch-Workflow

### Schritt 1: Bestätigung einholen

Frage den User:
> "Ich werde alle deine Plugin-Daten unwiderruflich löschen: Profil, Aktivitäten, Analysen, Vorschläge und Bausteine. Bist du sicher?"

**Nur bei expliziter Bestätigung** ("ja", "sicher", "löschen") fortfahren.

### Schritt 2: Dateien löschen

Lösche alle Dateien im `context/`-Verzeichnis **außer** `context/welcome.md` per `rm`:

```bash
# Jede Datei einzeln mit rm löschen (Bash-Tool verwenden):
rm -f context/profil.json
rm -f context/aktivitaeten.json
rm -f context/analyse.json
rm -f context/vorschlaege.json
rm -f context/bausteine.json
rm -f context/fortschritt.json
```

Verwende das Bash-Tool mit `rm -f` für jede Datei. Das `-f` Flag verhindert Fehlermeldungen bei nicht vorhandenen Dateien. **Niemals** `rm -rf context/` oder Wildcards verwenden — nur die explizit gelisteten Dateien löschen.

### Schritt 3: Bestätigung ausgeben

```
Alle Plugin-Daten gelöscht:

- Profil: gelöscht
- Aktivitäten: gelöscht (X Einträge entfernt)
- Analyse: gelöscht / nicht vorhanden
- Vorschläge: gelöscht / nicht vorhanden
- Bausteine: gelöscht / nicht vorhanden
- Fortschritt: gelöscht / nicht vorhanden

Du kannst jederzeit neu starten mit /team-profil.
```

---

## Regeln

- **Niemals** ohne explizite Bestätigung löschen
- **Niemals** `context/welcome.md` löschen (Plugin-Infrastruktur)
- Bei Abbruch ("nein", "stopp", "doch nicht"): Sofort abbrechen, nichts löschen
- Sprache: Deutsch
- Duze den User

