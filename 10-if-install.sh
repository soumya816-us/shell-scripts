#!/bin/bash

USERID=$(id -u) # checking is it root user or not

if [ $USERID -ne 0 ]
then 
    echo "ERROR:: you must have sudo access to execute script"
    exit 1 # other than exit 0 you can give any number "exit 0 means success"
fi

dnf list installed mysql # before installing mysql checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install mysql -y

    if [ $? -ne 0 ] # again checking installation of mysql is success or not
    then 
        echo " installing mysql .... Failure "
        exit 1
    else
        echo " installing mysql .... Success "
    fi
else
 echo " Mysql is Already Installed"
 fi


# if [ $? -ne 0 ]
# then 
#     echo " installing mysql .... Failure "
#     exit 1
# else
#     echo " installing mysql .... Success "
# fi

dnf list installed git # before installing git checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ] #again checking installation of mysql is success or not
    then 
        echo " installing Git .... Failure "
        exit 1
    else
        echo " installing Git .... Success "
    fi
else
echo "Git is Already Installed"
fi