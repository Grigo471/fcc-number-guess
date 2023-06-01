#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_TO_GUESS=$(( $RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=1

GUESSING() {
  echo $1
  read GUESS
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    GUESSING "That is not an integer, guess again:" $2
  else
    if [[ $GUESS = $NUMBER_TO_GUESS ]]
    then
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (guesses, user_id) VALUES ($NUMBER_OF_GUESSES, $2)")
    else
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
      if [[ $GUESS > $NUMBER_TO_GUESS ]]
      then
        GUESSING "It's lower than that, guess again:" $2
      else
        GUESSING "It's higher than that, guess again:" $2
      fi
    fi
  fi
}

echo "Enter your username:"
read USERNAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id='$USER_ID'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id='$USER_ID'")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

GUESSING "Guess the secret number between 1 and 1000:" $USER_ID
