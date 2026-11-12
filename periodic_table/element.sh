#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

if ! ELEMENT_INFO=$(psql \
  --username=freecodecamp \
  --dbname=periodic_table \
  --no-psqlrc \
  --quiet \
  --tuples-only \
  --no-align \
  --field-separator='|' \
  --set=element="$1" <<'SQL'
    SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass,
           p.melting_point_celsius, p.boiling_point_celsius
    FROM elements e
    JOIN properties p USING (atomic_number)
    JOIN types t USING (type_id)
    WHERE e.atomic_number::TEXT = :'element'
       OR e.symbol = :'element'
       OR e.name = :'element';
SQL
); then
  exit 1
fi

if [[ -z "$ELEMENT_INFO" ]]; then
  echo "I could not find that element in the database."
  exit 0
fi

IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_INFO"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
