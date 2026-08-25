#!/bin/bash

# 1. Datenbankname korrigiert
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# 2. Leerzeichen nach der Klammer korrigiert
if [[ -z $1 ]]
then
  # 3. Überflüssiges echo oben gelöscht, hier ist es perfekt!
  echo "Please provide an element as an argument."
else
  # Prüfen, ob $1 eine Zahl ist
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # Wenn ja: Suche nach der atomic_number
    ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = $1;")
  else
    # Wenn nein (es ist Text): Suche nach Symbol ODER Name 
    ELEMENT_INFO=$($PSQL "SELECT elements.atomic_number, elements.name, elements.symbol, types.type, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number = properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.symbol = '$1' OR elements.name = '$1';")
  fi
  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    # 5. Nur noch eine Schleife nötig, da wir alle Daten in einer Zeile haben
    echo "$ELEMENT_INFO" | while IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    done
  fi
fi










