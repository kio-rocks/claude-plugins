---
description: "Regelwerk extrahieren — Prozessregeln systematisch aus Mandantenwissen ableiten"
argument-hint: "<Prozessbereich oder Regelwerk-Dimension>"
allowed-tools: ["Read", "Write"]
---

┌─────────────────────────────────────────────────────────┐
│                 REGELWERK-EXTRAKTION                     │
├─────────────────────────────────────────────────────────┤
│  STANDALONE (always works)                              │
│  ✓ Prozessregeln aus Beschreibungen extrahieren         │
│  ✓ Regelwerk nach Dimensionen strukturieren             │
│  ✓ Quality-Check mit Vollständigkeitsprüfung            │
├─────────────────────────────────────────────────────────┤
│  SUPERCHARGED (zukünftig mit Connectors)                │
│  + Dokumenten-Management: Prozessdoku automatisch laden │
│  + Wissensdatenbank: Cross-Referenz mit Best Practices  │
└─────────────────────────────────────────────────────────┘

# /regelwerk-extraktion

Der Kern-Command des Prozess-Profilers. Startet eine strukturierte Interview-Session, in der die Regeln aus deinen Arbeitsprozessen extrahiert werden.

## Was ich brauche

**Option A: Prozessbereich benennen**
Nenne den Bereich: "Auftragsabwicklung" oder "Reklamationsbearbeitung"

**Option B: Frei beschreiben**
Beschreibe den Prozess in eigenen Worten: "Wenn ein Kunde reklamiert, prüfen wir erst die Sendungsverfolgung, dann..."

---

## Ablauf

Delegiert an: profiler-coach Agent. Two-Step: (1) Analyse → Aktivitäten identifizieren, (2) Tiefenextraktion pro Aktivität. Speichert Ergebnisse in context/prozesse.json. Kann unterbrochen und fortgesetzt werden (Status pro Aktivität).

### Bei bestehendem Fortschritt

Wenn `context/prozesse.json` existiert und offene Aktivitäten enthält (Status "erkannt" oder "in-extraktion"):

1. Lese den aktuellen Stand
2. Zeige dem User, welche Aktivitäten noch offen sind
3. Frage: "Sollen wir bei [nächste offene Aktivität] weitermachen?"
4. Setze die Extraktion fort

### Bei neuem Start

1. Lese `context/profil.json` für Kontext (Name, Rolle, Prozessbereich)
2. Delegiere an den `profiler-coach` Agent
3. Der Agent führt durch:
   - **Begrüßung** (1 Min): Kurz erklären was passiert
   - **Prozess-Aufnahme** (5-10 Min): User beschreibt Prozess, Agent nutzt `prozess-analyse` Skill
   - **Tiefenextraktion** (10-15 Min pro Aktivität): Agent nutzt `regel-extraktion` Skill
   - **Validierung** (2 Min pro Aktivität): Agent nutzt `quality-check` Skill

### Unterbrechen

Die Session kann jederzeit unterbrochen werden. Der Fortschritt wird nach jeder Aktivität gespeichert. Beim nächsten `/regelwerk-extraktion` wird dort fortgesetzt wo aufgehört wurde.

---

## Ergebnis

Jede extrahierte Aktivität wird in `context/prozesse.json` gespeichert:

```
Aktivität: {{Name der Aktivität}}
Status:    {{erkannt | in-extraktion | extrahiert | validiert}}

  Trigger:        {{Was löst die Aktivität aus?}}
  Schritte:       {{Was genau passiert, in welcher Reihenfolge?}}
  Systeme:        {{Welche Tools werden genutzt?}}
  Output:         {{Was kommt am Ende raus?}}
  Regeln:         {{Welche konkreten Werte/Schwellwerte gelten?}}
  Ausnahmen:      {{Was passiert bei Sonderfällen?}}
```

---

## Nächster Schritt

Nach vollständiger Extraktion:

```
/regelwerk-export
```

Exportiert das Regelwerk als strukturiertes Markdown-Artifact.
