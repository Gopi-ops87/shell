#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( basename "$0" .sh)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

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

for package in $@
do
    dnf list installed $package &>>"$LOG_FILE"
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>"$LOG_FILE"
        VALIDATE $? "$package"
    else
        echo "$package already installed.... $Y skipping $N" &>>"$LOG_FILE"
    fi
done