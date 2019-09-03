#!/bin/bash

USERNAME=$2
PASSWORD=$3

addUser()
{

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

    if [ $? -ne 0 ]
    then
        echo "Could not create $USERNAME"
        exit 1
    fi

    echo $USERNAME:$PASSWORD | chpasswd

    if [ $? -ne 0 ]
    then
        echo "Unable to set password for $USERNAME"
        exit 1
    fi

    # mail credentials file to user and then delete it
    mail -A ./credentials.txt -s "Here are your credentials" $USERNAME@ourcooltechcompany.com < /dev/null
    rm -rf ./credentials.txt

    # Copy rules file into user's home directory
    cp ./rules.txt /home/$USERNAME/

    # Send success message to user or to person running script
    echo "Successfully created user $USERNAME!"
}

deleteUser()
{
    userdel -r $USERNAME
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