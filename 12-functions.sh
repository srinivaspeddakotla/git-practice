#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is...FAILED"
        exit 1
    else 
        echo "$2 is...SUCCESS"
    fi 
}

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privileges"
    exit 1
fi

dnf list installed git


if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "installing Git"
else 
    echo "Git is already installed, nothing to do.."
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed, going to install it.."
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else 
    echo "MYSQL is already installed, nothing to do.."
fi



