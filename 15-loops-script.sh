#!/bin/bash

USERID=$(id -u) # checking is it root user or not

#colors added to the script
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"


VALIDATE(){

 if [ $1 -ne 0 ] # again checking installation is success or not
    then 
        echo -e " $2 .... $R Failure $N "
        exit 1
    else
        echo -e " $2 .... $G Success $N "
    fi

}

echo "script started executing at :: $TIMESTAMP" &>>$LOG_FILE_NAME

#USERID=$(id -u) # checking is it root user or not

if [ $USERID -ne 0 ] 
then 
    echo "ERROR:: you must have sudo access to execute script"
    exit 1 # other than exit 0 you can give any number "exit 0 means success"
fi

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE_NAME
        if [ $? -ne 0 ]
        then
            dnf install $package -y &>>$LOG_FILE_NAME
            VALIDATE $? "installing $package"
        else
            echo -e "$package is already $Y ... INSTALLED $N "
        fi
    done