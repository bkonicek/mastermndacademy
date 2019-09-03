#!/bin/bash

USERNAME=$2
PASSWORD=$3

# takes exit code and a message to print.
# If the exit code is not 0 it will print the error message
# and exit the script
checkError()
{
    ERROR_CODE=$1
    MESSAGE=$2
    if [ $ERROR_CODE -ne 0 ]
    then
        echo $MESSAGE
        exit 1
    fi
}

addUser()
{

    # If no password specified in arguments, generate a random password
    if [ -z $PASSWORD ]
    then
        PASSWORD=$(date +%s | sha256sum | base64 | head -c 32)
    fi

    useradd -m $USERNAME
    checkError $? "Could not create $USERNAME"

    echo $USERNAME:$PASSWORD | chpasswd
    checkError $? "Unable to set password for $USERNAME"

        # create a text file with username and password, then create the user and set the password
    echo "Hello $USERNAME, here are your credentials to log in." >> credentials.txt
    echo "" >> credentials.txt
    echo $USERNAME >> credentials.txt
    echo $PASSWORD >> credentials.txt

    # mail credentials file to user and then delete it
    mail -A ./credentials.txt -s "Here are your credentials" $USERNAME@ourcooltechcompany.com < /dev/null
    #checkError $? "Failed sending mail to $USERNAME@ourcooltechcompany.com"
    
    rm -rf ./credentials.txt

    # Copy rules file into user's home directory
    cp ./rules.txt /home/$USERNAME/

    # Send success message to user or to person running script
    echo "Successfully created user $USERNAME!"
}

deleteUser()
{
    userdel -r $USERNAME
    checkError $? "Failed to delete user $USERNAME"
    echo "$USERNAME has been deleted"
}

if [ $1 == "add" ]
then
    addUser
elif [ $1 == "remove" ]
then
    deleteUser
else
    echo "You need to specify either 'add' or 'remove'."
fi