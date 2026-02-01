#!/bin/bash

USER_ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USER_ID -ne 0 ]; then 
   echo -e "ERROR: use root access"
   exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo -e "Error: $2... $R installation is failed $N"
       exit 1
    else 
       echo -e " $2.. $G installation is successfull $N"
    fi
}

dnf list installed mysql
    if [ $? -ne 0 ]; then
       dnf install mysql -y
    else
       echo -e "Already mysql is installed... $Y Skipping $N"
    fi
VALIDATE $? "MYSQL"

dnf list installed nginx
     if [ $? -ne 0 ]; then 
        dnf install nginx -y
     else 
        echo -e "NGNX already installed... $Y skipping $N"
     fi
VALIDATE $? "NGINX"