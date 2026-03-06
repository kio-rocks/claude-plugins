# Output-Template: Extrahiertes Regelwerk pro Aktivität

Nutze dieses Format für jede vollständig extrahierte Aktivität.

---

## Aktivitäts-Profil: [Name der Aktivität]

### Metadaten

| Feld | Wert |
|------|------|
| **Aktivität** | [Präziser Name] |
| **Prozessbereich** | [z.B. Logistik, Sales, Grafik, Kundenservice, Einkauf] |
| **Frequenz** | [z.B. Täglich, Wöchentlich, Bei Bedarf, Pro Auftrag] |
| **Geschätzter Zeitaufwand** | [z.B. 45 Min/Tag, 2h/Woche] |
| **Automatisierungsklasse** | A (vollautomatisch) / B (hybrid) / C (manuell) |

### Klassifikationskriterien

Klasse bestimmen nach:
- **A (Vollautomatisch):** Kein menschliches Urteil nötig. Klare Input/Output-Beziehung. Alle Regeln dokumentierbar. Daten strukturiert in Systemen.
- **B (Hybrid):** Vorarbeit automatisierbar, Entscheidung an bestimmten Punkten erfordert menschliches Urteil. Human-in-the-Loop.
- **C (Manuell):** Erfordert Kreativität, Empathie, strategisches Denken. Keine klaren Regeln ableitbar.

### 1. Trigger

Was löst diese Aktivität aus?

| Trigger-Typ | Beschreibung |
|-------------|-------------|
| [Zeitbasiert / Ereignisbasiert / Bedingungsbasiert] | [Konkreter Trigger mit Werten] |

Beispiel:
| Trigger-Typ | Beschreibung |
|-------------|-------------|
| Zeitbasiert | Jeden Werktag morgens als erste Aufgabe |
| Bedingungsbasiert | Nur wenn offene Bestellungen existieren |

### 2. Schritte

Konkrete Schritte in Reihenfolge:

| # | Schritt | System | Details |
|---|---------|--------|---------|
| 1 | [Was] | [Wo] | [Wie genau] |
| 2 | ... | ... | ... |

### 3. Systeme

| System | Genutzt für | Zugriffspunkt |
|--------|-------------|---------------|
| [Name] | [Welcher Schritt] | [URL, Bereich, Modul] |

### 4. Output

| Feld | Beschreibung |
|------|-------------|
| **Format** | [E-Mail, Excel, Report, Datei, Systemeintrag, ...] |
| **Empfänger** | [Wer bekommt das Ergebnis?] |
| **Inhalt** | [Was enthält der Output konkret?] |
| **Beispiel** | [Konkretes Beispiel wenn möglich] |

### 5. Regeln und Schwellwerte

Hier werden ALLE konkreten Regeln dokumentiert, die der User anwendet.

| # | Regel | Konkreter Wert | Typ |
|---|-------|---------------|-----|
| R1 | [Beschreibung] | [Exakter Wert, Range oder Bedingung] | [Schwellwert / Klassifikation / Berechnung / Zuordnung] |
| R2 | ... | ... | ... |

**Regel-Typen:**
- **Schwellwert:** Ab/bis-Werte die eine Aktion auslösen (z.B. ">36h = kritisch")
- **Klassifikation:** Einteilung in Kategorien (z.B. "4 Statusgruppen")
- **Berechnung:** Formeln oder Kalkulationslogik (z.B. "Einkaufspreis / (1 - Zielmarge)")
- **Zuordnung:** Mapping zwischen Eingabe und Aktion (z.B. "Deal-Aktion → alle 4 Formate")

### 6. Ausnahmen und Sonderfälle

| # | Sonderfall | Bedingung | Aktion |
|---|-----------|-----------|--------|
| A1 | [Was passiert] | [Wann tritt es ein] | [Was tust du dann] |
| A2 | ... | ... | ... |

### 7. Abhängigkeiten

| Abhängigkeit | Beschreibung |
|-------------|-------------|
| **Voraussetzungen** | [Was muss vorher erledigt sein?] |
| **Nachfolger** | [Was hängt von diesem Ergebnis ab?] |
| **Personen** | [Wer ist beteiligt oder muss informiert werden?] |

---

## Vollständigkeits-Check

Vor Abschluss einer Aktivität prüfen:

- [ ] Trigger ist konkret (nicht "regelmäßig", sondern "jeden Werktag morgens")
- [ ] Alle Schritte haben ein System zugeordnet
- [ ] Jeder Schwellwert hat einen konkreten Wert (nicht "ungefähr" oder "circa")
- [ ] Jede Entscheidung hat einen Entscheidungsbaum (nicht "je nachdem")
- [ ] Mindestens ein Sonderfall/Ausnahme dokumentiert (es gibt IMMER welche)
- [ ] Output-Format und Empfänger sind klar
- [ ] Abhängigkeiten sind geprüft
