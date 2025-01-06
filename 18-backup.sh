#!/bin/bash

#colors added to the script
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user not providing number of days,we are taking 14days



LOGS_FOLDER="/home/ec2-user/shellscript-logs"
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

USAGE()
{
    echo -e " $R USAGE :: $N sh 18-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(OPTIONAL)>"
exit 1
}


mkdir -p /home/ec2-user/shellscript-logs

if [ $# -lt 2 ]
then
    USAGE
fi

if [ ! -d $SOURCE_DIR ] # ! means false ...no souce dir and ! failure means possitive means true
then
 
 echo -e "$SOURCE_DIR $R Does not exist.. $N please check"
 exit 1

fi

if [ ! -d $DEST_DIR ] # ! means false ...no souce dir and ! failure means possitive means true
then
 
 echo -e "$DEST_DIR $R Does not exist.. $N please check "
 exit 1

fi
echo "script started executing at :: $TIMESTAMP" &>>$LOG_FILE_NAME

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)


if [ -n "$FILES" ] # -n means not empty
then
    echo "Files are: $FILES"
else
    echo "No files found older than $DAYS"
fi