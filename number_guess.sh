#!/bin/bash

RANDOM_NUMBER=$(($RANDOM%1000)) # the random number that must be guessed
PSQL="psql --username=freecodecamp --dbname=number_game -t --no-align -c"

echo "Enter your username: "
read USERNAME

if [[ -z $($PSQL "SELECT user_name FROM users WHERE user_name = '$USERNAME'") ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here. "
  $PSQL "INSERT INTO users (user_name, games_played) VALUES ('$USERNAME', 0)"
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE user_name = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_name = '$USERNAME'")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses. "
fi

NUMBER_OF_GUESSES=0
echo "Guess the secret number between 1 and 1000: "

while [[ $GUESS != $RANDOM_NUMBER ]]
do
 read GUESS
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again: "
  elif [[ $GUESS > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again: "
  elif [[ $GUESS < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again: "
  fi
  NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
done

$($PSQL "UPDATE users SET games_played = $(($GAMES_PLAYED+1)) WHERE user_name = '$USERNAME'")

if [[ $NUMBER_OF_GUESSES < $BEST_GAME || -z $BEST_GAME ]]
then
  $($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_name = '$USERNAME'")
fi

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job! "
