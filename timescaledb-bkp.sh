#!/bin/bash
#set -x
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# Database credentials
uname="wisilica"
#paswd="w1s1l1ca"
server="targus-wisilica-com"
db_nme="targus"
bkp_path="/opt/psql-daily-backup"
tstamp=$(date +"%d-%b-%Y-%H-%M-%S")
s3_bkt="wisprod-db-backups-oregon"
log_path="/var/log/psql_bkp/dump.log"
##dummp without paswd
export PGPASSWORD='w1s1l1ca'
echo "creating backup of database start at $tstamp" >> "$log_path"
pg_dump -Fc $db_nme -h localhost -U $uname | gzip > $bkp_path/timedb-$tstamp.dump.gz
aws s3 cp $bkp_path/timedb-$tstamp.dump.gz s3://$s3_bkt/$server/timedb/ >> "$log_path"
#find $bkp_path/* -type f -mmin +360 -delete
