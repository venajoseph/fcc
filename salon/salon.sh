#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~Salon Services~~~~\n"

SERVICES_OFFERED(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
SALON_SERVICES=$($PSQL "SELECT * FROM services")
echo "$SALON_SERVICES" | while read SERVICE_ID BAR NAME
do 
  echo "$SERVICE_ID) $NAME"
done
}

MENU_SELECTION(){
  # ask which service is needed
  echo -e "\nWhich service do you need?"
  read SERVICE_ID_SELECTED

  # if input is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ [0-9]+$ ]]
  then
    # show list of services
    SERVICES_OFFERED "Please select from the available services"
  else
    # check if services is available
    CUSTOMER_CHOICE=$($PSQL "SELECT service_id FROM services WHERE $SERVICE_ID_SELECTED = service_id")
    if [[ -z $CUSTOMER_CHOICE ]]
    then
      SERVICES_OFFERED "I'm sorry. We do not offer this service. How else can I help you?"
    else

    # get customer info
    echo -e "\nWhat is your phone number?"
    read CUSTOMER_PHONE

    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # if customer doesn't exist
    if [[ -z $CUSTOMER_ID ]]
    then
    # get new customer name
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME

    # insert new customer to database
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    # get new customer id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi

    # get customer name
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # ask for appointment time
    echo What time would you like to come in?
    read SERVICE_TIME

    # inster appointment
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

    # get service ino
    SERVICE_INFO=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

    # confirm appointment
    echo "I have put you down for a $(echo $SERVICE_INFO | sed -E 's/^ *//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *//g')."
  
    fi

  fi
}

SERVICES_OFFERED
MENU_SELECTION