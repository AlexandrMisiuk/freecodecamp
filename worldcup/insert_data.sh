#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

set -e

TEAM_VALUES=()
GAME_VALUES=()
while IFS="," read -r YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != "winner" ]]
  then
    TEAM_VALUES+=("('$WINNER')" "('$OPPONENT')")
    GAME_VALUES+=("($YEAR,'$ROUND','$WINNER','$OPPONENT',$WINNER_GOALS,$OPPONENT_GOALS)")
  fi
done < games.csv

TEAM_VALUES_SQL=$(printf "%s," "${TEAM_VALUES[@]}")
TEAM_VALUES_SQL=${TEAM_VALUES_SQL%,}
GAME_VALUES_SQL=$(printf "%s," "${GAME_VALUES[@]}")
GAME_VALUES_SQL=${GAME_VALUES_SQL%,}

echo $($PSQL "TRUNCATE TABLE games, teams;")
echo $($PSQL "INSERT INTO teams(name) SELECT DISTINCT team FROM (VALUES $TEAM_VALUES_SQL) AS teams(team) ON CONFLICT(name) DO NOTHING;")
echo $($PSQL "
INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
SELECT game.year, game.round, winner.team_id, opponent.team_id,
       game.winner_goals, game.opponent_goals
FROM (VALUES $GAME_VALUES_SQL) AS game(year, round, winner, opponent, winner_goals, opponent_goals)
JOIN teams AS winner ON winner.name = game.winner
JOIN teams AS opponent ON opponent.name = game.opponent;")
