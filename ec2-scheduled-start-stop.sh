#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/qa-team/bin:/home/qa-team/.local/bin


if [ "$1" == 'start' ] || [ "$1" == 'stop' ]; then

#list of Instances in Cron based start/Stop 
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-01dda5f180e73c04c --region us-east-2	
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-0261d96a10e5bfc04 --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-0340718e0bc558d1e --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-04d2693d16d6a198f --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-0b57686bf46921371 --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-0c1f1d7752df4c24d --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-0f2acca49afd8c284 --region us-east-2
/usr/local/bin/aws ec2 "$1"-instances --instance-ids i-03f6e3dcfbd0f8f9d --region us-east-2

#-----------------------------------------
else
echo "please pass input parameter as start OR stop"
fi
