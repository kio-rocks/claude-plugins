# 6 Dimensionen der Regel-Extraktion

Detaillierte Anleitung für jede Dimension der Tiefenextraktion. Pro Dimension: Was du herausfinden musst, typische Fragen, Tiefenkriterien.

## 1. Trigger

**Was du herausfinden musst:** Was löst diese Aktivität aus? Zeitpunkt, Ereignis, Bedingung?

**Typische Fragen:**
- "Wann machst du das? Jeden Tag? Nur wenn X passiert?"
- "Gibt es eine feste Uhrzeit oder machst du das wenn du dazu kommst?"
- "Was muss vorher passiert sein, damit du damit anfängst?"

**Tief genug wenn:** Trigger-Typ (zeitbasiert/ereignisbasiert/bedingungsbasiert) und konkrete Beschreibung stehen.

**Nicht tief genug:** "Regelmäßig" (wie regelmäßig?), "Wenn nötig" (wann ist es nötig?).

## 2. Schritte

**Was du herausfinden musst:** Was genau tust du, in welcher Reihenfolge?

**Typische Fragen:**
- "Was ist der erste Schritt? Was kommt danach?"
- "Gibt es eine feste Reihenfolge oder variiert das?"
- "Du hast [Schritt] erwähnt -- was passiert da genau?"

**Tief genug wenn:** Jeder Schritt hat eine Aktion, ein System und ggf. Details.

**Nicht tief genug:** "Ich bearbeite das" (wie genau?), "Ich schaue mir das an" (was genau und worauf achtest du?).

## 3. Systeme

**Was du herausfinden musst:** Welche Tools, Software, Dateien nutzt du?

**Typische Fragen:**
- "Wo machst du das? Welches System öffnest du?"
- "Gibt es einen bestimmten Bereich oder ein Modul im System?"
- "Nutzt du dafür eine Vorlage oder ein Template?"

**Tief genug wenn:** System-Name, Verwendungszweck und Zugriffspunkt stehen.

**Nicht tief genug:** "Im System" (welches?), "Am Computer" (welches Programm?).

## 4. Output

**Was du herausfinden musst:** Was kommt am Ende raus? Für wen? In welchem Format?

**Typische Fragen:**
- "Was ist das Ergebnis? Wer bekommt es?"
- "In welchem Format gibst du das weiter? E-Mail, Excel, mündlich?"
- "Was enthält die Ausgabe konkret?"

**Tief genug wenn:** Format, Empfänger und konkreter Inhalt stehen.

**Nicht tief genug:** "Eine E-Mail" (an wen? mit welchem Inhalt? welcher Betreff?), "Ein Report" (welche Daten enthält er?).

## 5. Regeln und Schwellwerte

**Was du herausfinden musst:** Welche konkreten Werte, Grenzen, Kriterien gelten?

**Typische Fragen:**
- "Ab wann ist das kritisch? Welcher Wert ist die Grenze?"
- "Wie unterscheidest du X von Y?"
- "Gibt es verschiedene Kategorien? Nach welchem Schema teilst du ein?"
- "Rechnest du da etwas aus? Nach welcher Formel?"

**Tief genug wenn:** Jede Regel hat einen konkreten Wert, eine Range oder einen Entscheidungsbaum.

**Nicht tief genug:** "Ungefähr", "Je nachdem", "Normalerweise" -- siehe Vagheits-Muster im quality-check Skill.

## 6. Ausnahmen und Sonderfälle

**Was du herausfinden musst:** Was passiert bei Sonderfällen, Fehlern, Abweichungen?

**Typische Fragen:**
- "Was machst du wenn X nicht klappt?"
- "Gibt es Fälle wo du anders vorgehst?"
- "Was passiert an Feiertagen / bei Systemausfall / bei Sonderkunden?"
- "Wie oft kommt das vor -- und was machst du dann?"

**Tief genug wenn:** Mindestens ein Sonderfall dokumentiert ist mit Bedingung und Aktion.

**Nicht tief genug:** "Passiert selten" (Häufigkeit ist irrelevant, die Regel muss trotzdem dokumentiert sein).

## Übergänge zwischen Dimensionen

- **Trigger → Schritte:** "OK, du startest also [Trigger]. Was ist dann der erste konkrete Schritt?"
- **Schritte → Systeme:** "Du hast [System] erwähnt -- nutzt du noch andere Tools dafür?"
- **Systeme → Output:** "Und was kommt am Ende raus? Wer bekommt das Ergebnis?"
- **Output → Regeln:** "Gibt es bei [Output] bestimmte Werte oder Grenzen die du beachtest?"
- **Regeln → Ausnahmen:** "Was passiert wenn [Regel] mal nicht zutrifft?"
