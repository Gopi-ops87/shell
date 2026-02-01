#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "Error: use root access"
   exit 1;
fi

VALIDATE() {
    if [ $1 -ne 0 ]; then
       echo "ERROR: $2 installation is failed"
    else
       echo "Successful: $2 installation is success"
    
}

dnf install mysql -y
VALIDATE $? "MYSQL"

dnf install nginx -y
VALIDATE $? "NGINX"