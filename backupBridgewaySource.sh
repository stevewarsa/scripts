rm -rf /cygdrive/c/backup/code/BridgewaySiteSource2/backup/Bridgeway
cp -R /cygdrive/c/backup/code/BridgewaySiteSource2/Bridgeway/ /cygdrive/c/backup/code/BridgewaySiteSource2/backup/
rm -rf /cygdrive/c/backup/code/BridgewaySiteSource2/backup/Bridgeway/bridgeway/node_modules/
rm /cygdrive/c/backup/code/BridgewaySiteSource2/backup/Bridgeway/WebContent/media/sermons/*.mp3
rm -rf /cygdrive/c/backup/code/BridgewaySiteSource2/backup/Bridgeway/.svn/
cd /cygdrive/c/backup/code/BridgewaySiteSource2/backup/
date_time=`date +"%a-%b-%d-%Y-%H-%M-%S"`
echo $date_time
echo "Zipping file with name: bridgewaysrc_$date_time.zip"
zip -r bridgewaysrc_$date_time.zip Bridgeway
scp bridgewaysrc_$date_time.zip bridgewa@bridgewaycc.org:/home/bridgewa/backup
