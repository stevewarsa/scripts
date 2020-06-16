#!/bin/bash
rm -rf /cygdrive/c/backup/code/Angular2/nuggets/backup-from-server-old/
mv /cygdrive/c/backup/code/Angular2/nuggets/backup-from-server/ /cygdrive/c/backup/code/Angular2/nuggets/backup-from-server-old/
scp -r swarsa_memoryverses@ssh.phx.nearlyfreespeech.net:/home/public/nuggets/server /cygdrive/c/backup/code/Angular2/nuggets/backup-from-server/
echo "This is the back up from nearlyfreespeech.net of the complete Nuggets server directory including all user's databases and the PHP code.  The backup is done to c:/backup/code/Angular2/nuggets/backup-from-server and there is a backup of yesterday's backup at c:/backup/code/Angular2/nuggets/backup-from-server-old" | email -f swarsa480@gmail.com -n SteveWarsa -s "backup completed" -r smtp.gmail.com -p 587 steve_warsa@yahoo.com
