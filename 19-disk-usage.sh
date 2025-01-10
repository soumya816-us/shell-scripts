#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOULD=5 #in real projects will monitor for 70
MSG=""
while read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " '{print $NF}')
    #echo "Partition: $PARTITION , Usage: $USAGE "
    if [ $USAGE -ge $DISK_THRESHOULD ]
    then
        MSG+="High Disk Usage on partition: $PARTITION Usage is $USAGE \n "
        fi
done <<< $DISK_USAGE

echo -e "Message: $MSG"
echo "$MSG" | mutt -s "High disk usage" soumyareddy816@gmail.com