#!/bin/bash

echo "enter number: "

read NUMBER=$1

if [ $NUMBER -lt 10 ]; then
   echo "given number is less than 10"
else 
   echo "given number is greater than or equal to 10"
fi