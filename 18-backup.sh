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


if [ -n "$FILES" ] # -n means not empty ..true if there are files to zip
then
    echo "Files are: $FILES"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"
   if [ -f "$zip_file" ]
   then
        echo -e "Successfully created zipfile for files older than $DAYS"
        while read -r file # HERE file is a variable name you can give any name
        do
        echo "Deleting file: $file "
        rm -rf $file
        done <<< $FILES_TO_DELETE
   else
         echo -e "$R Error: $N Failed to create Zip file"
   fi
else
    echo "No files found older than $DAYS"
fi