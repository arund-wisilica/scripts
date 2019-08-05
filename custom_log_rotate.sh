#!/bin/bash
#set -x
logdir=/var/www/html/wiseconnect/api/data/logs/
cd $logdir || exit 1
ret=1
len=$( ( expr "$(ls -d */ | wc -l)" - $ret ) )
log_directories=( $(ls -d */ | sort -n -r | tail -n $len | rev | cut -c 2- | rev))
for j in "${log_directories[@]}";do
#sleep 1s

tar -cvzf $j.tar.gz $j
#rm -r $j
#echo $j 
done
