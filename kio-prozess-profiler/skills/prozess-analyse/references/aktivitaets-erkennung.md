# Aktivitäts-Erkennung in Freitext

Muster zur Identifizierung eigenständiger Aktivitäten in natürlichen Prozessbeschreibungen.

## Erkennungsmuster

### 1. Verb-basierte Erkennung

Eigenständige Aktivitäten beginnen typischerweise mit Handlungsverben:

| Verb-Cluster | Beispiel | Aktivitäts-Signal |
|-------------|----------|-------------------|
| Prüfen, Kontrollieren, Abgleichen | "Ich prüfe jeden Morgen die offenen Aufträge" | Ja -- eigenständige Prüf-Aktivität |
| Exportieren, Importieren, Laden | "Ich exportiere die Daten aus dem ERP" | Meist Teil einer größeren Aktivität |
| Schreiben, Erstellen, Formulieren | "Ich schreibe eine Mail ans Team" | Ja, wenn Output-orientiert |
| Vergleichen, Analysieren, Bewerten | "Ich vergleiche die Zahlen vom Vortag" | Ja -- eigenständige Analyse-Aktivität |
| Koordinieren, Abstimmen, Besprechen | "Ich stimme mich mit dem Lager ab" | Ja, wenn regelmäßig |

### 2. Zeitmarker als Aktivitäts-Trenner

Neue Zeitangaben markieren oft den Beginn einer neuen Aktivität:

- "Jeden Morgen..." / "Als erstes..."
- "Danach..." / "Dann..."
- "Montags..." / "Wöchentlich..."
- "Wenn [Ereignis]..." / "Falls..."
- "Am Ende des Tages..."

### 3. Granularitäts-Heuristik

Eine Aktivität hat die richtige Granularität wenn:

| Zu fein (zusammenfassen) | Richtig | Zu grob (aufteilen) |
|--------------------------|---------|---------------------|
| "Odoo öffnen" | "Versand-Dashboard prüfen" | "Logistik machen" |
| "Excel-Datei speichern" | "Tagesreport erstellen" | "Alles mit Reports" |
| "Filter setzen" | "Offene Aufträge analysieren" | "Daten bearbeiten" |

**Faustregel:** Eine Aktivität dauert 5 Minuten bis 2 Stunden und hat ein erkennbares Ergebnis.

### 4. Verschachtelte Aktivitäten erkennen

Wenn der User verschachtelt beschreibt ("Dabei mache ich auch noch..."):

- Prüfe ob die verschachtelte Tätigkeit eigenständig auftreten kann
- Wenn ja: Separate Aktivität mit Abhängigkeit dokumentieren
- Wenn nein: Als Schritt der Hauptaktivität erfassen

### 5. Implizite Aktivitäten

Achte auf beiläufig erwähnte Tätigkeiten:

- "Ach ja, und ich pflege auch noch die Kundendaten" -- eigene Aktivität
- "Nebenbei beantworte ich auch Kunden-Mails" -- eigene Aktivität
- "Das mache ich dann auch gleich mit" -- prüfen ob eigenständig
