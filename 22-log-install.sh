#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script started executed at: $(date)"

if [ $USER_ID -ne 0 ]; then 
   echo -e "ERROR: use root access" &>>$LOG_FILE
   exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo -e "Error: $2... $R installation is failed $N" &>>$LOG_FILE
       exit 1
    else 
       echo -e " $2.. $G installation is successfull $N" &>>$LOG_FILE
    fi
}

dnf list installed mysql
    if [ $? -ne 0 ]; then
       dnf install mysql -y
       VALIDATE $? "MYSQL"
    else
       echo -e "Already mysql is installed... $Y Skipping $N" &>>$LOG_FILE
    fi

dnf list installed nginx
    if [ $? -ne 0 ]; then 
        dnf install nginx -y
        VALIDATE $? "NGINX"
    else 
        echo -e "NGNX already installed... $Y skipping $N" &>>$LOG_FILE
    fi
