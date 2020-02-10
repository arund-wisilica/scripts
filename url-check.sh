#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
## apt install mailutils
## change from field accordingly
status=$(curl --write-out "%{http_code}\n" --silent --output /dev/null "https://wiseconnectall.wisilica.com/lightweb/src/user/login")

if [ "$status" -ne "200" ]; then
pwd
#echo "wiseconnectall apache is stuck" | mail "From: OpsAlerts <opsalerts@dinoct.com>" "adas@wisilica.com"
echo "App URL not giving any https 200 Status , Anyway apache restarted now and still problem persists contact admin" | mail -s "wiseconnectall apache is Stuck" -aFrom:Ops_alerts\<root@ip-172-31-75-230.ec2.internal\> adas@wisilica.com
/etc/init.d/apache2 restart
fi

