#!/bin/bash

set -euo pipefail
export LC_ALL=C

run_query() {
  local query=$1

  printf '%s\n' "$query" |
    psql --no-psqlrc --username=freecodecamp --dbname=number_guess \
      --quiet --tuples-only --no-align --field-separator='|' \
      --set=username="$username"
}

normalize_integer() {
  local value=$1
  local sign=

  case "$value" in
    -*) sign=-; value=${value#-} ;;
    +*) value=${value#+} ;;
  esac

  while [[ ${#value} -gt 1 && ${value:0:1} == 0 ]]; do
    value=${value:1}
  done

  if [[ $value == 0 ]]; then
    sign=
  fi

  printf '%s%s' "$sign" "$value"
}

secret_number=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read -r username

user_id=$(run_query "SELECT user_id FROM users WHERE user_name = :'username';")

if [[ -z $user_id ]]; then
  user_id=$(run_query "INSERT INTO users (user_name) VALUES (:'username') RETURNING user_id;")
  echo "Welcome, $username! It looks like this is your first time here."
else
  IFS='|' read -r games_played best_game <<< "$(run_query "SELECT COUNT(*), COALESCE(MIN(number_of_guesses), 0) FROM games WHERE user_id = $user_id;")"
  echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
fi

guess_count=0
echo "Guess the secret number between 1 and 1000:"
read -r guess

while true; do
  guess_count=$((guess_count + 1))

  if [[ ! $guess =~ ^[+-]?[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    read -r guess
    continue
  fi

  normalized_guess=$(normalize_integer "$guess")

  if [[ $normalized_guess == "$secret_number" ]]; then
    run_query "INSERT INTO games (user_id, number_of_guesses) VALUES ($user_id, $guess_count);"
    echo "You guessed it in $guess_count tries. The secret number was $secret_number. Nice job!"
    break
  fi

  if [[ $normalized_guess == -* ]]; then
    echo "It's higher than that, guess again:"
  elif [[ ${#normalized_guess} -gt ${#secret_number} ]] ||
    { [[ ${#normalized_guess} -eq ${#secret_number} ]] && [[ $normalized_guess > $secret_number ]]; }; then
    echo "It's lower than that, guess again:"
  else
    echo "It's higher than that, guess again:"
  fi

  read -r guess
done
