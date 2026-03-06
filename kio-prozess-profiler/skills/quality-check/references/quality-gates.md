# Quality Gates: Vagheits-Erkennung

6 Vagheits-Muster die anzeigen, dass eine Antwort nicht tief genug ist. Jedes Muster hat ein Erkennungssignal und eine passende Nachfrage.

## Die 6 Vagheits-Muster

### V1: Ungefähr-Muster

**Erkennungssignale:** "ungefähr", "circa", "so um die", "grob geschätzt", "pi mal Daumen"

**Was fehlt:** Konkreter Wert oder Range

**Nachfrage-Template:**
> "Was ist der genaue Wert? Oder gibt es eine Ober- und Untergrenze?"

**Beispiel:**
- Vage: "Ungefähr 30 Bestellungen am Tag"
- Konkret: "Zwischen 20 und 40 Bestellungen, Durchschnitt 30"

### V2: Kritisch-Muster

**Erkennungssignale:** "wenn es zu viel wird", "wenn es kritisch ist", "wenn es eng wird", "bei Bedarf"

**Was fehlt:** Konkreter Schwellwert

**Nachfrage-Template:**
> "Ab welcher Zahl ist es 'zu viel'? Ab wann genau wird es kritisch?"

**Beispiel:**
- Vage: "Wenn es zu viele offene Aufträge sind"
- Konkret: "Ab 50 offenen Aufträgen eskaliere ich"

### V3: Je-nachdem-Muster

**Erkennungssignale:** "je nachdem", "kommt drauf an", "unterschiedlich", "variiert"

**Was fehlt:** Entscheidungsbaum

**Nachfrage-Template:**
> "Wovon hängt es ab? Was sind die möglichen Fälle, und was machst du bei jedem?"

**Beispiel:**
- Vage: "Je nachdem welcher Kunde"
- Konkret: "A-Kunden: sofort bearbeiten. B-Kunden: innerhalb 24h. C-Kunden: Sammelbearbeitung freitags."

### V4: Normalerweise-Muster

**Erkennungssignale:** "normalerweise", "meistens", "in der Regel", "üblicherweise"

**Was fehlt:** Regel + Ausnahmen

**Nachfrage-Template:**
> "Was ist die Regel? Und was sind die Ausnahmen -- wann machst du es anders?"

**Beispiel:**
- Vage: "Normalerweise schicke ich das per Mail"
- Konkret: "Per Mail, außer bei dringenden Fällen (Ampel rot) -- dann rufe ich direkt an."

### V5: Ergibt-sich-Muster

**Erkennungssignale:** "das ergibt sich", "das sieht man", "das merkt man", "erkennt man sofort"

**Was fehlt:** Messbare Kriterien

**Nachfrage-Template:**
> "Woran genau erkennst du das? Was sind die konkreten Merkmale?"

**Beispiel:**
- Vage: "Das sieht man ob das passt"
- Konkret: "Produkt muss erkennbar sein, Hintergrund einfarbig oder Lifestyle ohne Ablenkung, Markenfit (Farbwelt passt)"

### V6: Bauchgefühl-Muster

**Erkennungssignale:** "Bauchgefühl", "Erfahrung", "nach Gefühl", "man weiß das einfach"

**Was fehlt:** Die Regeln hinter der Erfahrung

**Nachfrage-Template:**
> "Wenn du es einem neuen Kollegen erklären müsstest: Welche 3 Dinge würdest du ihm sagen, worauf er achten soll?"

**Beispiel:**
- Vage: "Das ist Erfahrungssache"
- Konkret: "Drei Kriterien: 1) Lieferzeit unter 5 Tagen, 2) Marge über 30%, 3) Bestandsmenge reicht für die Aktion"

## Vollständigkeits-Checkliste

Keine Aktivität als "validiert" markieren solange:

- [ ] Ein Schwellwert als "ungefähr" beschrieben ist
- [ ] Eine Entscheidung als "je nachdem" beschrieben ist
- [ ] Ein Sonderfall mit "passiert selten" abgetan wird (Häufigkeit ist irrelevant -- die REGEL muss dokumentiert sein)
- [ ] Ein Output-Format unklar ist ("eine E-Mail" -- an wen? mit welchem Inhalt?)
- [ ] Ein System nur als "das System" ohne konkreten Namen referenziert wird
