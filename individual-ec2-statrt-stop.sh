#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/dev01/bin:/home/dev01/.local/bin


case "$1" in

m1)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-01dda5f180e73c04c --region us-east-2	
;;
m2)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-0261d96a10e5bfc04 --region us-east-2
;;
m3)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-0340718e0bc558d1e --region us-east-2
;;
m4)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-04d2693d16d6a198f --region us-east-2
;;
m5)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-0b57686bf46921371 --region us-east-2
;;
m6)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-0c1f1d7752df4c24d --region us-east-2
;;
m7)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-0f2acca49afd8c284 --region us-east-2
;;
m8)
/usr/local/bin/aws ec2 "$2"-instances --instance-ids i-03f6e3dcfbd0f8f9d --region us-east-2
;;
esac
