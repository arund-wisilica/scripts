#!/bin/bash
#set -x
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Database credentials
uname="demo"
paswd="HN5VohG1fpBkSg"
server="wiseconnect01"
db_nme="wiseconnectapp"

bkp_path="/opt/mysql-daily-backup"
tstamp=$(date +"%d-%b-%Y-%H-%M-%S")
s3_bkt="wisprod-db-backups-oregon"

log_path="/var/log/mysql_bkp/dump.log"

echo "creating backup of database start at $tstamp" >> "$log_path"

#mysqldump -u $uname  --databases $db_nme  -p$paswd > $bkp_path/$db_nme-$tstamp.sql
mysqldump --routines=true --events=true --triggers=true -u $uname  --databases $db_nme  -p$paswd | gzip > $bkp_path/$db_nme-$tstamp.sql.gz 
size=$(stat -c%s "$bkp_path/$db_nme-$tstamp.sql.gz")

if [  "$size" -lt "100000000" ]; then

  /usr/local/bin/alrt adas@wisilica.com Wiseconnect01_Daily_Backup "Backup failed  please try manually "
echo "Backup failed to create $tstamp" >> "$log_path"
rm $bkp_path/$db_nme-$tstamp.sql.gz && exit

fi
#
echo "Finished backup of database locally at $tstamp" >> "$log_path"
aws s3 cp $bkp_path/$db_nme-$tstamp.sql.gz s3://$s3_bkt/$server/

echo "Finished backup of database to s3 at $tstamp" >> "$log_path"




#Delete files older than 15 days

#find  $bkp_path/*   -mtime +15   -exec rm  {}  \;
