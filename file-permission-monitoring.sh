#!/bin/bash
cr=`echo $'\n.'`
cr=${cr%.}
#set -x
fc=$(ls -dl `find /var/www/html/targus/api/data/logs` | grep root ) 
#fc=$(ls -dl `find /var/www/html/targus/api/data/logs -type d` | grep root  ) 
if [ $( ls -dl `find /var/www/html/targus/api/data/logs -type d` | grep root | wc -l ) -ge 1 ]; then

/scripts/mail.sh adas@wisilica.com "WARNNING...!!! Following Log Permisions Lost on targus.wisilica.com Server..." "=========================================== $cr echo $fc $cr ===========================================$cr Attempted to Fix Permision If This alert repeats Fix issues manually $cr ==========================================="
/scripts/mail.sh jsreedharan@wisilica.com "WARNNING...!!! Following Log Permisions Lost on targus.wisilica.com Server..." "=========================================== $cr echo $fc $cr ===========================================$cr Attempted to Fix Permision If This alert repeats Fix issues manually $cr ==========================================="
/scripts/mail.sh koadattil@wisilica.com "WARNNING...!!! Following Log Permisions Lost on targus.wisilica.com Server ..." "=========================================== $cr echo $fc $cr ===========================================$cr Attempted to Fix Permision If This alert repeats Fix issues manually $cr ==========================================="
/scripts/mail.sh jviju@wisilica.com "WARNNING...!!! Following Log Permisions Lost on targus.wisilica.com Server..." "=========================================== $cr echo $fc $cr ===========================================$cr Attempted to Fix Permision If This alert repeats Fix issues manually $cr ==========================================="
echo test
fi

fnames=( $(ls -dl `find /var/www/html/targus/api/data/logs` | grep root | awk '{print $9}'))

for k in "${fnames[@]}";do
chown -R www-data:www-data $k
ls -la $k
done
