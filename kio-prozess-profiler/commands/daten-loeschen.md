---
description: "Lokale Plugin-Daten löschen — Profil und Prozessdaten DSGVO-konform entfernen"
argument-hint: "<'alle' oder Mandantenname>"
allowed-tools: ["Read", "Write", "Bash"]
---

┌─────────────────────────────────────────────────────────┐
│                    DATEN LÖSCHEN                         │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Lokale Profil- und Prozessdaten entfernen            │
│  ✓ Bestätigungsdialog vor Löschung                      │
│  ✓ DSGVO Art. 17 konform                                │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Audit-Log: Löschvorgang protokollieren               │
│  + Cloud-Sync: Remote-Daten ebenfalls entfernen         │
└─────────────────────────────────────────────────────────┘

# /daten-löschen

Lösche alle lokalen Daten, die dieses Plugin gespeichert hat. Entspricht dem DSGVO-Löschrecht (Art. 17).

## Was ich brauche

**Option A: Alles löschen**
Ohne Argument oder mit "alle" -- löscht sämtliche Plugin-Daten.

**Option B: Mandant benennen**
Nenne einen Mandantennamen -- löscht nur die Daten dieses Mandanten (sofern mehrere Profile existieren).

---

## Was gelöscht wird

| Datei | Inhalt |
|-------|--------|
| `context/profil.json` | Dein Profil (Name, Rolle, Team, Prozessbereich) |
| `context/prozesse.json` | Alle erfassten Prozessbereiche und extrahierten Aktivitäten |

---

## Ablauf

### Schritt 1: Bestätigung einholen

Frage den User:
> "Ich werde alle deine Plugin-Daten unwiderruflich löschen: Profil und alle extrahierten Prozessdaten. Bist du sicher?"

**Nur bei expliziter Bestätigung** ("ja", "sicher", "löschen") fortfahren.

### Schritt 2: Dateien löschen

Lösche alle Dateien im `context/`-Verzeichnis **außer** `context/welcome.md` per `rm`:

```bash
rm -f context/profil.json
rm -f context/prozesse.json
```

Verwende das Bash-Tool mit `rm -f` für jede Datei. Das `-f` Flag verhindert Fehlermeldungen bei nicht vorhandenen Dateien. **Niemals** `rm -rf context/` oder Wildcards verwenden -- nur die explizit gelisteten Dateien löschen.

### Schritt 3: Bestätigung ausgeben

## Ergebnis

```
Alle Plugin-Daten gelöscht:

- Profil: gelöscht
- Prozessdaten: gelöscht ({{X}} Bereiche, {{Y}} Aktivitäten entfernt)

Du kannst jederzeit neu starten mit /profil-anlegen.
```

---

## Regeln

- **Niemals** ohne explizite Bestätigung löschen
- **Niemals** `context/welcome.md` löschen (Plugin-Infrastruktur)
- Bei Abbruch ("nein", "stopp", "doch nicht"): Sofort abbrechen, nichts löschen
- Sprache: Deutsch
- Duze den User

---

## Datenschutz

Die Löschung entfernt die Dateien vollständig von deinem Gerät. Konversationen mit Claude werden separat von Anthropic gespeichert und unterliegen den Anthropic-Nutzungsbedingungen. Informiere dich bei deiner IT-Abteilung über den bestehenden Vertrag mit Anthropic.
