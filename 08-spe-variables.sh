#!/bin/bash

echo "current script name is: $0"
echo "first argument is: $1"
echo "second argument is: $2"
echo "number of args is: $#"
echo "all args seperately : $@"
echo "all arguments as one string: $*"
echo "PID of current script: $$"
echo "exit status of last command: $?"
echo "PID of last bacground command: $0"
echo "current user home terminal is: $HOME"
echo "current user path is: $PWD"
echo "current user is: $USER"
