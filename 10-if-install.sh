#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: you must have sudo access to execute script"
    exit 1 # other than exit 0 you can give any number "exit 0 means success"
fi


dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo " installing mysql .... Failure "
    exit 1
else
    echo " installing mysql .... Success "
fi

dnf install git -y

if [ $? -ne 0 ]
then 
    echo " installing Git .... Failure "
    exit 1
else
    echo " installing Git .... Success "
fi
