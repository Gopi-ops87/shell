#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 15 ]; then
   echo "given number $NUMBER is greater than 15"
elif [ $NUMBER -eq 15 ]; then
   echo "given number $NUMBER is equal to 15"
else
   echo "given number $NUMBER is less than 15"