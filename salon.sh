#!/bin/bash
# a script to simulate a salon chatbot or something.
# while I could have hardcoded some values, everything is abstracted to retrieve it from the db
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only --no-align -c"
echo -e "\n~~~ My Salon ~~~\n"
echo -e "Welcome to my salon, how can I help you?\n"

# Retrieve the number of services we have. Didn't include this in SERVICE_MENU() because it would be unnecessary to go through multiple times.
NUMBER_OF_SERVICES=$($PSQL "SELECT MAX(service_id) FROM services;")

OPEN_SERVICE_MENU() {
  
  if [[ $1 ]] # print error statement if this function is reiterated
  then
    echo -e "\n$1"
  fi
  
  # then loop through and list them out
  i=1
  while [ $i -lt 6 ]
  do
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$i;")
  echo "$i) $SERVICE_NAME"
  i=$(($i+1))
  done
  # ask for their choice
  read SERVICE_ID
  SERVICE_CHOICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID;")
  # if their choice is not valid
  if [[ -z $SERVICE_CHOICE_NAME ]]
  then
    OPEN_SERVICE_MENU "I could not find that service. What would you like today."
  fi
}

OPEN_SERVICE_MENU

# ask for phone number
ASK_FOR_PHONE() {
  if [[ $1 ]]
  then
    echo "\n$1"
  fi

  # ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  # check if phone number is in valid format
  if [[ $CUSTOMER_PHONE =~ ^[0-9]{3}-[0-9]{3}-[0-9]{4}$ ]]
  then
  # if it is, retrieve associated customer's name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  else
  # if it isn't, ask again
    ASK_FOR_PHONE "\nYour phone number should be formatted as ###-###-####."
  fi
}

ASK_FOR_PHONE

# if customer is not in db
if [[ -z $CUSTOMER_NAME ]]
then
  # ask for name
  echo -e "\nI don't have a record for that phone number. What's your name?"
  read CUSTOMER_NAME
  # and insert customer into database
  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  if [[ $INSERT_CUSTOMER_RESULT != "INSERT 0 1" ]]
  then
    echo "We're having a problem adding you to our system: $INSERT_CUSTOMER_RESULT"
  fi
fi

# retrieve customer id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")

# ask for service time
echo -e "\nWhat time would you like your $SERVICE_CHOICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# and insert into db
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME')")
if [[ $INSERT_APPOINTMENT_RESULT = "INSERT 0 1" ]]
then
  # finally, reiterate appointment
  echo -e "\nI have put you down for a $SERVICE_CHOICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
else
  echo $INSERT_APPOINTMENT_RESULT
fi
