#!/bin/bash
PSQL="psql psql --username=freecodecamp --dbname=salon -t -A -F"," -c"

SERVICE_NAME=""
SERVICE_ID_SELECTED=""

MAIN_MENU() {
  if [[ ! $1 ]]
  then
    echo -e "Welcome to My Salon, how can I help you?\n"
  else
    echo -e "\n$1"
  fi

  
  $PSQL "SELECT * FROM services;" | while IFS="," read -r ID NAME
  do
    echo "$ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

  if [[ -n "$SERVICE_NAME" ]]; then
    MAKE_APPOINTMENT
  else
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
}

MAKE_APPOINTMENT() {
  if [[ ! $1 ]]
  then
    echo -e "\nWhat's your phone number?"
  else
    echo -e "\n$1"
  fi

  CUSTOMER_NAME=""
  CUSTOMER_ID=""

  FINISH_APPOINTMENT() {
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    ADD_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  }

  read CUSTOMER_PHONE

  if [[ -n "$CUSTOMER_PHONE" ]]
  then
    while IFS="," read -r NAME C_ID; do
      CUSTOMER_NAME=$NAME
      CUSTOMER_ID=$C_ID
    done < <($PSQL "SELECT name, customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    if [[ -n "$CUSTOMER_NAME" ]]; then
      FINISH_APPOINTMENT
    else
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
      # echo "$ADD_CUSTOMER_RESULT $CUSTOMER_ID"
      FINISH_APPOINTMENT
    fi
  else
    MAKE_APPOINTMENT "Please enter the phone number as 555-555-5555"
  fi

}

# MAIN PROGRAM
echo -e "\n~~~~~ MY SALON ~~~~~\n"
MAIN_MENU
