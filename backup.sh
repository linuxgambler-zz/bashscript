#!/bin/bash

#Title 		: Backup script
#Author		: Sagar Malve
#Date		: Mon Aug  1 18:45:37 IST 2016
#Purpose	: This script is develop to take backup using Cron Job in linux.
#Version	: 0.1
#Bash_Version   : Tested on GNU BASH version 4.3.11
#OS Specs 	: Ubunt 14.04 LTS


# Create s3backup.log file to get the log of each argument in /var/log

echo -e  "\n Backup started" >> /var/log/s3backup.log
echo `date` >> /var/log/s3backup.log

lock_file="/tmp/$0.lock"

trap '{echo Exit; rm -rfv $lock_file;}' INT TERM

if [ ! -f $lock_file ]
then
        touch $lock_file        
        tar cvfzP /mnt/demositebackup_$(date +%Y-%m-%d).tar.gz   /var/www/html >> /var/log/s3backup.log
        mysqldump -u(user) -p(passwd) --single-transaction --routines --triggers --all-databases | gzip > /mnt/backupdb_$(date +%Y-%m-%d).sql.gz
        if [ $? -eq 0 ]
        then
        	echo " Backup Completed" >> /var/log/s3backup.log
        	 rm -rf $lock_file
        else
        	echo "file backup is fail" >> /var/log/s3backup.log
        	rm -rf $lock_file
        fi

else 
	echo "Backup is already running"
	exit 12
fi
