#!/bin/bash

USERNAME=$1
PASSWORD=$2

# simple bash script demonstrating arguments
useradd $USERNAME

EXIT_CODE=$?

# pass the username and password from the arguments into chpasswd
echo $USERNAME:$PASSWORD | chpasswd

# Send success message to user or to person running script
if [ $EXIT_CODE -eq 0 ]
then
    echo "Successfully created user $USERNAME!"
else
    echo "Could not create user $USERNAME"
fi