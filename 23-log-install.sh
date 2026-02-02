#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell"
SCRIPT_NAME=$( basename "$0" .sh)
LOGS_FILE="$LOGS_FOLDER/$SCRIPTNAME.log"

mkdir -p $LOGS_FOLDER

echo "======================" &>>"$LOG_FILE"
echo "script started executed at: $(date)" &>>"$LOG_FILE"

if [ $USER_ID -ne 0 ]; then
    echo "ERROR:: please use root access"
    echo "ERROR:: please use root access" &>>"$LOG_FILE"
    exit 1
fi

VALIDATE() {
            if [ $1 -ne 0 ]; then
                echo "ERROR:: $2 ....$R installation is failed $N"
                echo "ERROR:: $2 ....$R installation is failed $N" &>>"$LOG_FILE"
                exit 1
            else
                echo "$2.. $G Installaton is success $N"
                echo "$2.. $G Installaton is success $N" &>>"$LOG_FILE"
            fi
}

dnf list installed mysql &>/dev/null
    if [ $? -ne 0 ]; then
        dnf install mysql -y &>>"$LOG_FILE"
        validate $? "MYSQL" 
    else
        echo "MySql already installed ...$Y skipping $N"
        echo "MySql already installed ...$Y skipping $N" &>>"$LOG_FILE"
    fi

dnf list installed nginx &>/dev/null
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>"$LOG_FILE"
        validate $? "NGINX" 
    else
        echo "NGINX already installed ...$Y skipping $N"
        echo "MySql already installed ...$Y skipping $N" &>>"$LOG_FILE"
    fi


