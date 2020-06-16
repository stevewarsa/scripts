#!/bin/bash

# first need to close outlook otherwise won't be able to back up the pst file
/cygdrive/c/backup/programs/nircmd/nircmd.exe closeprocess outlook.exe
echo "Outlook closing. Sleeping 60 seconds to wait for it..."
sleep 60
echo "Woke up!"
curr_time=`date +"%a-%b-%d-%Y-%H-%M-%S"`
echo "Starting backup at $curr_time..."
/cygdrive/c/FreeFileSync/FreeFileSync.exe c:/backup/code/ffs/FreeFileSyncBatchJob.ffs_batch
echo "The back up is complete!"
end_time=`date +"%a-%b-%d-%Y-%H-%M-%S"`
echo "Backup completed.  Started at $curr_time, ended at $end_time" > /home/warsa/email_message.txt
echo "------------------------------------------------------------" >> /home/warsa/email_message.txt
echo "Printing usage stats into email...."
/home/warsa/printUsageStats.sh "/home/warsa/email_message.txt"
echo "Sending email..."
#cat /home/warsa/email_message.txt | email -f swarsa@msn.com -n SteveWarsa -s "backup completed" -r smtp.west.cox.net -p 25 steve_warsa@yahoo.com
python /cygdrive/c/backup/code/PythonSQLiteScripts/SQLite/cg/christian/send_daily_backup_email.py
echo "Email sent - script is complete."
# restart outlook now
#/cygdrive/c/Program\ Files/Microsoft\ Office\ 15/root/office15/OUTLOOK.EXE &

