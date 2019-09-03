#!/bin/bash

USERNAME=$1
PASSWORD=$2

# simple bash script demonstrating arguments

EXIT_CODE=$?

# If no password specified in arguments, generate a random password
if [ -z $PASSWORD ]
then
    PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
fi

# create a text file with username and password, then create the user and set the password
echo "Hello $USERNAME, here are your credentials to log in." >> credentials.txt
echo "" >> credentials.txt
echo $USERNAME >> credentials.txt
echo $PASSWORD >> credentials.txt

useradd -m $USERNAME

echo $USERNAME:$PASSWORD | chpasswd

# mail credentials file to user and then delete it
mail -A ./credentials.txt -s "Here are your credentials" $USERNAME@ourcooltechcompany.com < /dev/null
rm -rf ./credentials.txt

# Copy rules file into user's home directory
cp ./rules.txt /home/$USERNAME/

# Send success message to user or to person running script
if [ $EXIT_CODE -eq 0 ]
then
    echo "Successfully created user $USERNAME!"
else
    echo "Could not create user $USERNAME"
fi