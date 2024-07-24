#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

MAIN(){
  # Menu start
  echo -e "\n~~~~~ NUMBER GUESSING GAME ~~~~~\n"
  # ask for username
  echo -n "Enter your username: " 
  read USERNAME
  # gather user info
  USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username = '$USERNAME'")
  # no user, register the user and start the game
  if [[ -z $USER_ID ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    CREATE_USER=$($PSQL "INSERT INTO usernames (username, games_played, best_game) VALUES('$USERNAME',0,0)")
    USER_ID=$($PSQL "SELECT user_id FROM usernames WHERE username='$USERNAME'")
    GAME $USER_ID 0 0
  # if already registered, display information and start the game  
  else
    USER_GAMES=$($PSQL "SELECT games_played FROM usernames WHERE username='$USERNAME'")
    USER_BEST=$($PSQL "SELECT best_game FROM usernames WHERE username='$USERNAME'")
    echo -e "\nWelcome back, $USERNAME! You have played $USER_GAMES games, and your best game took $USER_BEST guesses."
    GAME $USER_ID $USER_GAMES $USER_BEST
  fi
}

GAME(){
  # game started
  # initiate game variable: user, how many times played before and best game
  USER_ID=$1
  GAMES_PLAYED=$2
  BEST_GAME=$3
  ATTEMPTS=1
  # create secret number
  SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
  # ask for guess
  echo -n "Guess the secret number between 1 and 1000: "
  read GUESS
  # Evaluate if it is a integer
  while [[ ! $GUESS =~ ^[0-9]+$ ]]
  do
    echo -n "That is not an integer, guess again: "
    read GUESS
  done
  # Checking guess
  while [[ $GUESS -ne $SECRET_NUMBER ]]
  do
    # Give hints if wrong
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo -n "It's lower than that, guess again: "
      read GUESS
    else
      echo -n "It's higher than that, guess again: "
      read GUESS
    fi
    ATTEMPTS=$(( $ATTEMPTS + 1 ))
  done
  #finish game and update games played
  echo "You guessed it in $ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
  GAMES_PLAYED=$(( $GAMES_PLAYED + 1 ))
  # Update database with games played and if it was better than the best game
  UPDATE_GAMES_PLAYED=$($PSQL "UPDATE usernames SET games_played=$GAMES_PLAYED WHERE user_id=$USER_ID")
  # if best game = 0, it's the first game then update to this game value if not compare and update
  # if it is best
  if [[ $BEST_GAME = 0 || $BEST_GAME > $ATTEMPTS ]]
  then
    UPDATE_BEST=$($PSQL "UPDATE usernames SET best_game=$ATTEMPTS WHERE user_id=$USER_ID")
  fi
}

MAIN
