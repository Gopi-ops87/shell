#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( basename "$0" .sh )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER

echo "=======================" &>>"$LOG_FILE"
echo "Script started executed at: $(date)" &>>"$LOG_FILE"

if [ $USER_ID -ne 0 ]; then 
   echo -e "ERROR: use root access"
   echo -e "ERROR: use root access" &>>"$LOG_FILE"
   exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then 
       echo -e "Error: $2... $R installation is failed $N"
       echo -e "Error: $2... $R installation is failed $N" &>>"$LOG_FILE"
       exit 1
    else 
       echo -e " $2.. $G installation is successfull $N"
       echo -e " $2.. $G installation is successfull $N" &>>"$LOG_FILE"
    fi
}

dnf list installed mysql
    if [ $? -ne 0 ]; then
       dnf install mysql -y &>>$LOG_FILE
       VALIDATE $? "MYSQL"
    else
       echo -e "Already mysql is installed... $Y Skipping $N"
       echo -e "Already mysql is installed... $Y Skipping $N" &>>$LOG_FILE
    fi

dnf list installed nginx
    if [ $? -ne 0 ]; then 
        dnf install nginx -y &>>$LOG_FILE
        VALIDATE $? "NGINX"
    else 
        echo -e "NGNX already installed... $Y skipping $N"
        echo -e "NGNX already installed... $Y skipping $N" &>>$LOG_FILE
    fi
