#!/bin/bash

# Insert db reference
PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

QUERY_DB() {
  # gather element information
  ELEMENT=$1
  ELEMENT_INFO=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties using(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $ELEMENT")
  # display element information
  echo "$ELEMENT_INFO" | while  read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT
  do
  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

MAIN() {
  # if an argument isn't inserted ask for one.
  if [[ $1 ]]
  then
    ARGUMENT=$1
    # query on the db for the argument
    # there are 3 possibilities atomic number, symbol or name
    # query for atomic number
    if [[ $ARGUMENT =~ ^[0-9]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $ARGUMENT")
      if [[ $ELEMENT ]]
      then 
        QUERY_DB $ELEMENT
      # if not found
      else
        echo -e "I could not find that element in the database."
      fi
    else
      # if not found query for symbol
      ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$ARGUMENT'")
      if [[ $ELEMENT ]]
      then 
        QUERY_DB $ELEMENT
      else
      # else query for name
        ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$ARGUMENT'")
        if [[ $ELEMENT ]]
        then
          QUERY_DB $ELEMENT
        else
        # if not found
        echo -e "I could not find that element in the database."
        fi
      fi
    fi
  else
  echo -e "Please provide an element as an argument."
  fi
}

MAIN $1
