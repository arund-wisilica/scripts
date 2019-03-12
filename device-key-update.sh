#!/bin/bash
#set -x
key_update ()
{
scp -i $1 /efs/keys.sql.gz $2:/tmp/ | grep -v "Warning: Using a password"
ssh -i $1 $2 'gunzip /tmp/keys.sql.gz'
ssh -i $1 $2 "mysql -u$3 -p$4 $5 < /tmp/keys.sql"
ssh -i $1 $2 'mysql -u'$3' -p'$4' '$5' -e "SELECT COUNT(*) tbl_device_key_mapping FROM tbl_device_key_mapping;"'
ssh -i $1 $2 'rm /tmp/keys.sql'

}



while :
do
    clear
    cat<<EOF
    ==============================
    Device Key-Map Update Tool..!!
    ------------------------------
    Please enter your choice:

    To Apply New Device keys to all Servers	 (1)
    To apply New Device keys for Specific server (2)
    Quit					 (q)
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
     "1")  echo "Updating device key mapping All servers......."

	    ####################---USER EDITTABLE SECTION---##############################################
	    key_update /home/arun/Downloads/build-server.pem ubuntu@18.206.150.63 root kgeGQkWstrMA ttt
	    #################---USER EDTITABLE SECTION END HERE---########################################
	    
	    ;;
    "2")  echo "Give Input in following Format" 
	  read -p "/path/pemfile.pem user@ip-address db-username db-password db-name `echo $'\n: '`" ff
	  
	  if [ $(echo $ff |wc -w) == 5 ]; then
		  echo "updating...."
	  	  key_update $ff
	  sleep 3

	 else
		echo "Invalid Aruguments"
		#sleep 1s
	fi 
	;;
    "q") exit ;;
     * )  echo "invalid option" 
	     sleep 1s
	    ;;
    esac
    sleep 1
done
