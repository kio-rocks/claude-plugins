# Few-Shot Examples: Tiefe Extraktion vs. Oberflächliche Extraktion

Diese Beispiele zeigen dir das MUSTER guter Prozess-Extraktion. Es geht nicht um den Domain-Inhalt, sondern um die Technik: Wie bohrt man nach, bis konkrete Regeln entstehen?

---

## Beispiel 1: Logistik -- Versand-Controlling

### Aktivitätsbeschreibung des Users

> "Ich exportiere alle offenen Aufträge, filtere nach Status und schreibe eine E-Mail an mein Team."

### Oberflächliche Extraktion (so NICHT)

- **Trigger:** Täglich
- **Schritte:** Export, Filter, E-Mail
- **Regeln:** Aufträge nach Status filtern
- **Ausnahmen:** Keine bekannt

*Warum schlecht: Keine konkreten Werte. "Nach Status filtern" ist keine Regel, sondern eine Tätigkeit. Welche Status? Was passiert bei welchem Status?*

### Tiefe Extraktion (so JA)

**Agent:** "Du filterst nach Status -- welche Status gibt es, und was bedeutet jeder für deine nächste Aktion?"

**User:** "Es gibt vier Kategorien: lieferbar, wartet auf Bestand, Adressfehler und Umlagerungen."

**Agent:** "Bei den lieferbaren Aufträgen -- alle gleich behandeln, oder gibt es Unterschiede?"

**User:** "Nein, da schaue ich, wie lange die schon lieferbar sind. Wenn das über 36 Stunden ist, ist das kritisch."

**Agent:** "Was bedeutet 'kritisch' -- was machst du dann konkret?"

**User:** "Da schicke ich eine separate Info an VCA, dass die sich drum kümmern müssen."

**Extrahierte Regeln:**

| Regel | Konkreter Wert |
|-------|---------------|
| Kategorisierung | 4 Gruppen: lieferbar, wartet auf Bestand, Adressfehler, Umlagerungen |
| Ampel lieferbar | Rot: >36h lieferbar. Gelb: 24-36h. Grün: <24h |
| Ampel Bestand | Rot: Lieferfrist überschritten (0 Tage). Gelb: noch 1 Tag. Grün: >1 Tag |
| Eskalation | Rot bei lieferbar → separate Info an VCA |
| Vergleichswert | Versendete Aufträge vom Vortag als Benchmark |

*Warum gut: Jede "Regel" hat einen konkreten Wert. Aus "ich filtere nach Status" wurde ein vollständiges Ampelsystem mit Schwellwerten und Eskalationspfad.*

---

## Beispiel 2: Sales -- Preiskalkulation

### Aktivitätsbeschreibung des Users

> "Ich kalkuliere Preise für unsere Aktionen."

### Oberflächliche Extraktion (so NICHT)

- **Trigger:** Bei neuer Aktion
- **Schritte:** Daten laden, kalkulieren, ins System eintragen
- **Regeln:** Marge berechnen
- **Ausnahmen:** Keine bekannt

*Warum schlecht: "Marge berechnen" sagt nichts. Welche Marge? Gleich für alles? Was ist der Ausgangspunkt?*

### Tiefe Extraktion (so JA)

**Agent:** "Du kalkulierst Preise -- nach welchem Schema? Gleiche Marge für alles?"

**User:** "Nein, das hängt vom Aktionstyp ab."

**Agent:** "Welche Aktionstypen gibt es, und welche Zielmarge hat jeder?"

**User:** "Deal-Aktionen haben andere Margen als Shop-Aktionen, und Outlet nochmal andere."

**Agent:** "Kannst du mir die Zielmargen pro Typ nennen?"

**User:** "Deal: 35%. Shop: 40%. Outlet: 25%."

**Agent:** "Und der Ausgangspunkt -- rechnest du vom Verkaufspreis rückwärts oder vom Einkaufspreis vorwärts?"

**User:** "Immer vom Einkaufspreis. Der Verkaufspreis ergibt sich."

**Agent:** "Wie verbindest du Einkaufs- und Verkaufsdaten? Die liegen in verschiedenen Systemen?"

**User:** "Über Artikelnummer plus Variante. Das ist der Matching-Key."

**Extrahierte Regeln:**

| Regel | Konkreter Wert |
|-------|---------------|
| Aktionstypen | 3: Deal, Shop, Outlet |
| Zielmarge Deal | 35% |
| Zielmarge Shop | 40% |
| Zielmarge Outlet | 25% |
| Kalkulationsrichtung | Vorwärts (Einkaufspreis → Verkaufspreis über Marge) |
| Matching-Key | Artikelnummer + Variante |
| Warnung | Bei Abweichung von Zielmarge → Ampelsystem |

*Warum gut: Aus "Preise kalkulieren" wurden 7 konkrete Regeln. Jeder Aktionstyp hat seine eigene Zielmarge. Der Matching-Key ist dokumentiert.*

---

## Beispiel 3: Grafik -- Bildauswahl

### Aktivitätsbeschreibung des Users

> "Ich suche passende Bilder für unsere Aktionen und setze sie in Vorlagen ein."

### Oberflächliche Extraktion (so NICHT)

- **Trigger:** Neue Aktion
- **Schritte:** Bild suchen, in Vorlage einsetzen
- **Regeln:** Bild muss passen
- **Ausnahmen:** Keine bekannt

*Warum schlecht: "Bild muss passen" ist das Gegenteil einer Regel. Was heißt "passen"?*

### Tiefe Extraktion (so JA)

**Agent:** "Was macht ein Bild 'passend'? Woran erkennst du, ob eines geeignet ist?"

**User:** "Das Produkt muss gut erkennbar sein, der Hintergrund sollte ruhig sein, und es muss zur Marke passen."

**Agent:** "Was bedeutet 'ruhiger Hintergrund' konkret? Weiß? Einfarbig? Oder auch Lifestyle?"

**User:** "Einfarbig oder Lifestyle ist okay, aber keine ablenkenden Elemente. Das Produkt muss im Vordergrund stehen."

**Agent:** "Du setzt die Bilder in Vorlagen ein -- welche Formate?"

**User:** "Kommt drauf an."

**Agent:** "Wovon hängt es ab? Welche Formate gibt es und wann brauchst du welches?"

**User:** "Für die Website brauche ich ein Querformat. Für Social Story ein Hochformat. Für den Newsletter einen Header-Banner. Und manchmal ein quadratisches Format für den Feed."

**Agent:** "Entscheidest du selbst welche Formate, oder gibt es eine feste Zuordnung pro Aktionstyp?"

**User:** "Hängt vom Aktionstyp ab. Deal-Aktionen brauchen alle vier. Shop-Aktionen nur Website und Newsletter."

**Extrahierte Regeln:**

| Regel | Konkreter Wert |
|-------|---------------|
| Bildkriterien | 3 Dimensionen: Produktklarheit, Hintergrundruhe, Markenfit |
| Hintergrund | Einfarbig oder Lifestyle ohne ablenkende Elemente. Produkt im Vordergrund |
| Formate | 4: Website-Querformat, Social-Story-Hochformat, Newsletter-Header, Feed-Quadrat |
| Format-Zuordnung Deal | Alle 4 Formate |
| Format-Zuordnung Shop | Nur Website + Newsletter |
| Suchpfad | Bilddatenbank nach Produktname + Hersteller |
| Kandidaten | 5-10 Vorschläge pro Aktion, Auswahl durch Grafikerin |

*Warum gut: Aus "Bild muss passen" wurden messbare Kriterien. Aus "kommt drauf an" wurde eine klare Format-Zuordnung pro Aktionstyp.*

---

## Das Muster erkennen

In allen drei Beispielen passiert dasselbe:

1. **User beschreibt abstrakt** → "Ich filtere", "Ich kalkuliere", "Ich suche"
2. **Agent fragt nach dem WIE** → "Welche Filter?", "Welche Marge?", "Welche Kriterien?"
3. **User antwortet vage** → "kommt drauf an", "je nachdem", "muss passen"
4. **Agent bohrt nach** → "Wovon hängt es ab? Was sind die konkreten Fälle?"
5. **User liefert die echte Regel** → "36 Stunden", "35% bei Deals", "4 Formate"

Das Ziel ist IMMER: Von der abstrakten Beschreibung zur konkreten Regel mit Wert.
