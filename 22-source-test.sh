#!/bin/bash

source ./common.sh
SOURCE_DIR="/home/ec2-user/app-logs"

echo "script started executing at :: $TIMESTAMP" &>>$LOG_FILE_NAME


FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo  "Files to be deleted: $FILES_TO_DELETE"

while read -r file 
do
echo "Deleting file: $file "
rm -rf $file
done <<< $FILES_TO_DELETE