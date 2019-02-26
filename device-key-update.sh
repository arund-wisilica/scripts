#!/bin/bash
#set -x
if [ $( ls /efs/ | wc -l) -gt 1 ]; then
echo Please Keep Latest Key File only
echo clear Old key files and Retry
exit
fi
echo eeee
gzip /efs/keys.sql
### $1= pemfile.pem $2=username@ip $3=mysql-user $4=mysql-pwd $5=db-name

key_update ()
{
scp -i $1 /efs/keys.sql.gz $2:/tmp/ | grep -v "Warning: Using a password"
ssh -i $1 $2 'gunzip /tmp/keys.sql.gz'
ssh -i $1 $2 "mysql -u$3 -p$4 $5 < /tmp/keys.sql"
ssh -i $1 $2 'rm /tmp/keys.sql' 

}

key_update /home/arun/Downloads/build-server.pem ubuntu@18.206.150.63 root kgeGQkWstrMA ttt 


#scp -i /home/arun/Downloads/build-server.pem /efs/keys ubuntu@18.206.150.63:/tmp/
#scp -i /home/arun/Downloads/build-server.pem /efs/update.sh buntu@18.206.150.63:/tmp/
#ssh -i /home/arun/Downloads/build-server.pem ubuntu@18.206.150.63 '/tmp/update.sh'
#ssh -i /home/arun/Downloads/build-server.pem ubuntu@18.206.150.63 'rm /tmp/keys.sql'
