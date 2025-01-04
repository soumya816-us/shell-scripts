#!/bin/bash


USERID=$(id -u) # checking is it root user or not


VALIDATE(){

 if [ $1 -ne 0 ] # again checking installation is success or not
    then 
        echo " $2 .... Failure "
        exit 1
    else
        echo " $2 .... Success "
    fi

}


#USERID=$(id -u) # checking is it root user or not

if [ $USERID -ne 0 ] 
then 
    echo "ERROR:: you must have sudo access to execute script"
    exit 1 # other than exit 0 you can give any number "exit 0 means success"
fi

dnf list installed mysql# before installing mysql checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "INSTALLING MYSQL"
   
else
 echo " Mysql is Already Installed"
 fi


dnf list installed git # before installing git checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install git -y
    VALIDATE $? "INSTALLING Git"
else
echo "Git is Already Installed"
fi