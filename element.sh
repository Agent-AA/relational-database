#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_ELEMENT_INFO () { # this is the function that will retrieve and return data
  GIVEN_COLUMN=$1
  GIVEN_VALUE=$2

  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE $GIVEN_COLUMN = '$GIVEN_VALUE'")
  NAME=$($PSQL "SELECT name FROM elements WHERE $GIVEN_COLUMN = '$GIVEN_VALUE'")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE $GIVEN_COLUMN = '$GIVEN_VALUE'")


  if [[ -z $ATOMIC_NUMBER || -z $NAME || -z $SYMBOL ]]
  then
    echo "I could not find that element in the database."
  else
    TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")

    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
    BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = $ATOMIC_NUMBER")

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]]
then
  GET_ELEMENT_INFO atomic_number $1
elif [[ $1 =~ ^[A-Z]$ || $1 =~ ^[A-Z][a-z]$ ]]
then
  GET_ELEMENT_INFO symbol $1
elif [[ $1 =~ ^[A-Z][a-z]+$ ]]
then
  GET_ELEMENT_INFO name $1
else
  echo "I could not find that element in the database."
fi
