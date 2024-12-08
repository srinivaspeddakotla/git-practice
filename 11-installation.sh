#!/bin/bash

USERID=$(id -u)
#echo "user ID is: $USERID"

if ($USERID -ne 0)
then 
    echo "Please run this script with root privileges"
    exit 1
fi

dnf installed git 

if [ $? -ne 0 ]
then
    echo "Git is not installed, going to install it.."
    dnf install git -y
    if [ $? -ne 0 ]
    then 
        echo "Git installation is not success....check it"
        exit 1
    else 
        echo "Git installation is success"
    fi
else 
    echo "Git is already installed, nothing to do.."
fi

dnf installed mysql

if [ $? -ne 0 ]
then
    echo "MYSQL is not installed, going to install it.."
    dnf install mysql -y
    if [ $? -ne 0 ]
    then 
        echo "MYSQL installation is not success....check it"
        exit 1
    else 
        echo "MYSQL installation is success"
    fi
else 
    echo "MYSQL is already installed, nothing to do.."
fi


