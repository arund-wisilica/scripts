#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

#delete older than 7 days of logs hm
#find  /var/www/html/wiseconnect/api/data/logs/* -ctime +7 -type d -exec rm -r {} \;

#truncate logs with size greater than 1GB
list=$(du -sch $(find /var/www/html/wiseconnect/api/data/logs/ -type f -size +999M -follow -print) | sort -n -r | head -n 5 | grep -v "total" | grep -v ".")
if [ "$list" = "" ]; then
exit
fi

for j in "${list[@]}";do
 fname=$(printf '%s\n' "${list[@]}" | awk '{print $2}')
pwd
echo $fname
#> $fname
done
