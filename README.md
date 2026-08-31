# Periodic Table Database

Dieses Projekt ist eine Kommandozeilen-Anwendung, die Informationen über chemische Elemente aus einer relationalen Datenbank abruft. Es entstand als Abschluss-Projekt für die "Relational Database" Zertifizierung von freeCodeCamp.

## Features

*   **Flexible Suche:** Elemente können über ihre Ordnungszahl (ID), ihr chemisches Symbol (z. B. "H") oder ihren vollständigen Namen gesucht werden.
*   **Fehlerbehandlung:** Das Skript fängt leere Eingaben oder nicht existierende Elemente sauber ab.
*   **Normalisierte Datenbank:** Die PostgreSQL-Datenbank nutzt Foreign Keys und relationale Tabellen (`elements`, `properties`, `types`), um Datenredundanz zu vermeiden.
*   **Komplexe Abfragen:** Das Bash-Skript greift über `INNER JOIN`-Befehle effizient auf alle drei Tabellen gleichzeitig zu.

## Tech Stack

*   **Datenbank:** PostgreSQL
*   **Skripting:** Bash (mit Regex zur Eingabevalidierung)
*   **Versionskontrolle:** Git

## Lokale Installation & Nutzung

Um das Skript lokal auszuführen, benötigst du ein Terminal (Bash) und eine lokal installierte **PostgreSQL**-Datenbank.

### 1. Repository klonen
```bash
git clone https://github.com/VanessaPoehl/fcc-periodic-table-database
cd fcc-periodic-table-database
```

### 2. Datenbank wiederherstellen
Nutze die bereitgestellte `.sql`-Datei, um die Datenbankstruktur samt allen Elementen zu laden.

**Linux / macOS / Git Bash:**
Im Idealfall hast du den Pfad zu PostgreSQL in deinen System-Umgebungsvariablen hinterlegt. Dann funktioniert dieser Standardbefehl:
```bash
psql -U postgres -f periodic_table.sql
```

**Windows (PowerShell):**
Falls `psql` nicht direkt gefunden wird, nutze den absoluten Pfad zur PostgreSQL-Installation (passe die Versionsnummer – z. B. 15, 16, 17 oder 18 – entsprechend an):
```powershell
& "C:\Program Files\PostgreSQL\<DEINE_VERSION>\bin\psql.exe" -U postgres -f periodic_table.sql
```

### 3. Skript ausführbar machen und starten
Das Skript benötigt genau ein Argument (Ordnungszahl, Symbol oder Name des Elements).

**Unter Linux / macOS / Git Bash:**
```bash
chmod +x element.sh
./element.sh 1
./element.sh H
./element.sh Hydrogen
```

**Unter Windows (PowerShell):**
```powershell
bash element.sh 1
```

---

## 🔬 Beispiel-Ausgabe
> **Eingabe:** `./element.sh 1`
> **Ausgabe:** The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

---

## Troubleshooting für lokale Setups (Windows)

**1. "psql: command not found" im Skript**
Da das Bash-Skript den globalen `psql`-Befehl nutzt, muss dein Terminal wissen, wo PostgreSQL installiert ist.
*Lösung:* Füge den Pfad temporär zu deiner Terminal-Sitzung hinzu (passe die Versionsnummer an):
```bash
export PATH=$PATH:"/c/Program Files/PostgreSQL/18/bin"
```

**2. Das Skript fragt nach dem Datenbank-Passwort**
Wenn deine lokale PostgreSQL-Installation passwortgeschützt ist, blockiert `psql` das Skript und wartet auf eine Eingabe.
*Lösung:* Speichere das Passwort temporär für deine aktuelle Terminal-Sitzung. Führe dazu (z. B. in der Git Bash) aus:
```bash
export PGPASSWORD="dein_passwort"
```

**3. Skript wirft Syntax-Fehler oder verhält sich merkwürdig (CRLF vs LF)**
Windows verwendet standardmäßig `CRLF` für Zeilenumbrüche, während Bash-Skripte `LF` erwarten. 
*Lösung:* Öffne die Datei `element.sh` in deinem Code-Editor (z. B. VS Code), klicke unten rechts in der Statusleiste auf `CRLF` und ändere es zu **`LF`**. Speichere die Datei ab und starte das Skript erneut.
