#!/bin/bash

USERID=$(id -u) # checking is it root user or not

#colors added to the script
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOGS_FILE-$TIMESTAMP.log"

VALIDATE(){

 if [ $1 -ne 0 ] # again checking installation is success or not
    then 
        echo -e " $2 .... $R Failure $N "
        exit 1
    else
        echo -e " $2 .... $G Success $N"
    fi

}

echo "script started executing at :: $TIMESTAMP" &>>LOG_FILE_NAME

#USERID=$(id -u) # checking is it root user or not

if [ $USERID -ne 0 ] 
then 
    echo "ERROR:: you must have sudo access to execute script"
    exit 1 # other than exit 0 you can give any number "exit 0 means success"
fi

dnf list installed mysql &>>LOG_FILE_NAME
# before installing mysql checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>LOG_FILE_NAME 
    VALIDATE $? "INSTALLING MYSQL"
   
else
 echo -e " Mysql is Already .... $Y Installed $N"
 fi


dnf list installed git &>>LOG_FILE_NAME
# before installing git checking it is installed before or not

if [ $? -ne 0 ]
then
    dnf install git -y &>>LOG_FILE_NAME
    VALIDATE $? "INSTALLING Git"
else
echo "Git is Already.... $Y Installed $N"
fi