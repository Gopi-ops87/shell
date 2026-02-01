#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "ERROR: Please use root access to install"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "ERROR: installation is failure"
else
   echo "Installation is successful"
fi