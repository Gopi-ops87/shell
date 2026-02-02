#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell"
SCRIPT_NAME=$( basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPTNAME.log"

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
                echo -e "ERROR:: $2 ....$R installation is failed $N"
                echo -e "ERROR:: $2 ....$R installation is failed $N" &>>"$LOG_FILE"
                exit 1
            else
                echo -e "$2.. $G Installaton is success $N"
                echo -e "$2.. $G Installaton is success $N" &>>"$LOG_FILE"
            fi
}

dnf list installed mysql &>/dev/null
    if [ $? -ne 0 ]; then
        dnf install mysql -y &>>"$LOG_FILE"
        VALIDATE $? "MYSQL" 
    else
        echo -e "MySql already installed ...$Y skipping $N"
        echo -e "MySql already installed ...$Y skipping $N" &>>"$LOG_FILE"
    fi

dnf list installed nginx &>/dev/null
    if [ $? -ne 0 ]; then
        dnf install nginx -y &>>"$LOG_FILE"
        VALIDATE $? "NGINX" 
    else
        echo -e "NGINX already installed ...$Y skipping $N"
        echo -e "MySql already installed ...$Y skipping $N" &>>"$LOG_FILE"
    fi


