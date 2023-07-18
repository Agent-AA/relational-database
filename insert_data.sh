#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# remove all data from databse
TRUNCATE_RESULT="$($PSQL "TRUNCATE TABLE games, teams")"
# and output result
echo $TRUNCATE_RESULT

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get winner team id
    WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    # if id doen't exist
    if [[ -z $WINNER_TEAM_ID ]]
    then
      # insert winner team into database
      INSERT_WINNER_TEAM_RESULT="$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")"
      # output result
      if [[ $INSERT_WINNER_TEAM_RESULT = "INSERT 0 1" ]]
      then
        echo Inserted team $WINNER
      else
        echo $INSERT_WINNER_TEAM_RESULT
      fi
    fi
    # then get opponent team id
    OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"
    # if id doesn't exist
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      # insert team into database
      INSERT_OPPONENT_TEAM_RESULT="$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")"
      # output result
      if [[ $INSERT_OPPONENT_TEAM_RESULT = "INSERT 0 1" ]]
      then
        echo Inserted team $OPPONENT
      else
        echo $INSERT_OPPONENT_TEAM_RESULT
      fi
    fi
  fi
done

# now to insert the games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get winner id
    WINNER_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER'")"
    # get opponent id
    OPPONENT_TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT'")"
    # insert game
    INSERT_GAME_RESULT="$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")"
    # output results
    if [[ $INSERT_GAME_RESULT = "INSERT 0 1" ]]
    then
      echo "Inserted game $WINNER vs. $OPPONENT ($YEAR, $ROUND) $WINNER_GOALS-$OPPONENT_GOALS"
    else
      echo $INSERT_GAME_RESULT
    fi 
  fi
done