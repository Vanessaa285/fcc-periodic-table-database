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

## Nutzung

Um das Skript lokal auszuführen, stelle sicher, dass PostgreSQL installiert ist.

1. Das Repository klonen:
   `git clone https://github.com/DEIN_NAME/periodic_table.git`
2. Die Datenbank wiederherstellen:
   `psql -U postgres < periodic_table.sql`
3. Das Skript ausführbar machen:
   `chmod +x element.sh`
4. Das Skript mit einem Argument starten:
   `./element.sh 1`
   `./element.sh Hydrogen`

**Beispiel-Ausgabe:**
> The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
