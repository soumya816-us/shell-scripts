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


