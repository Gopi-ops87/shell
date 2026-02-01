#!/bin/bash

echo "Enter number: "
read NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
   echo "the entered $NUMBER is even"
else
   echo "the entered number is ODD"
fi