#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ WR SALON ~~~~~\n"

MAIN_MENU() {
  # message of main menu if input is necessary
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # display list of services
  LIST_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo -e "\nHere are a list of our services. What would you like today?"
  echo "$LIST_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done

  # get service
  read SERVICE_ID_SELECTED

  # if input is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # send to main menu
    MAIN_MENU "That is not a valid service".
  else
    # check if it's a valid service
    CHECK_SERVICE_SELECTED=$($PSQL "SELECT service_id FROM services where service_id=$SERVICE_ID_SELECTED")
    # if not valid send to main menu
    if [[ -z $CHECK_SERVICE_SELECTED ]]
    then
      MAIN_MENU "You chose an invalid service. Please, choose again."
    # get customer phone number
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # if customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "\nWhat's your name?"
        read CUSTOMER_NAME

        # insert new customer
        INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi

      # get customer time
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed 's/ //')
      
      # get a valid service time
      while [[ -z $SERVICE_TIME ]]
      do
        echo -e "\nWhat time would you like your $SERVICE_NAME_FORMATTED, $(echo $CUSTOMER_NAME | sed 's/ //')?"
        read SERVICE_TIME
      done

      # create appointment
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

      # Appointment successfully created
      echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed 's/ //')." 
    fi
  fi
  
}

MAIN_MENU