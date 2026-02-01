#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="e[0m"

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then 
   echo -e "ERROR: ${R} use root access${N}"
   exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo -e "Error: ${R} $2 installation is failed${N}"
       exit 1
    else 
       echo -e "${G} $2 installation is successfull${N}"
    fi
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"