#!/bin/bash

USER_ID=$(id -u)

if [ $USER_ID -ne 0 ]; then
   echo "ERROR: Please run this script using root previllages"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "ERROR: Installation is falure"
else
   echo "Installation is successfull"
fi

