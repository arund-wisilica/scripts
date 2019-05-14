#!/bin/bash

#set -x
all_chk ()
{
v1=$(service critical-alert-service status | grep running  >/dev/null && echo 1 || echo 0)
v2=$(service warning-alert-service status | grep running  >/dev/null && echo 1 || echo 0)
v3=$(service notification-alert-service status | grep running  >/dev/null && echo 1 || echo 0)
v4=$(service connection-service status | grep running  >/dev/null && echo 1 || echo 0)
v5=$(service scheduler-service status | grep running  >/dev/null && echo 1 || echo 0)
v6=$(service scheduler-delete-service status | grep running  >/dev/null && echo 1 || echo 0)
v7=$(service scheduler-execute-service status | grep running  >/dev/null && echo 1 || echo 0)
v8=$(service decommision-service status | grep running  >/dev/null && echo 1 || echo 0)
v9=$(service wsoperation-service status | grep running  >/dev/null && echo 1 || echo 0)
v10=$(service occupancy-service status | grep running  >/dev/null && echo 1 || echo 0)
v11=$(service wellness-alert-cache-service status | grep running  >/dev/null && echo 1 || echo 0)
v12=$(service  node-service status | grep running  >/dev/null && echo 1 || echo 0)
v13=$(service  usage-duration-cache-service status | grep running  >/dev/null && echo 1 || echo 0)


}


case "$1" in
	1)
	#critical-alert-service
service critical-alert-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	2)
	#warning-alert-service
service warning-alert-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	3)
	#notification-alert-service status
service notification-alert-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	4)
	#connection-service
service connection-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	5)
	#scheduler-service
service scheduler-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	6)
	#scheduler-delete-service
service scheduler-delete-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	7)
	#scheduler-execute-service
service scheduler-execute-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	8)
	#decommision-service
service decommision-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	9)
	#wsoperation-service
service wsoperation-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	10)
	#occupancy-service
service occupancy-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	11)
	#wellness-alert-cache-service
service wellness-alert-cache-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	12)
	#node-service
service node-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	13)
        #usage-duration-cache-service
service usage-duration-cache-service status | grep running  >/dev/null && echo 1 || echo 0
;;

	14)
        #ota-hash-request-cache-service
service ota-hash-request-cache-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	15)
        #ota-progress-cache-service
service ota-progress-cache-service status | grep running  >/dev/null && echo 1 || echo 0
;;
	all)
	#all-services-check
all_chk
#v27=1
if [ "$v1" == '1' ] && [ "$v2" == '1' ] && [ "$v3" == '1' ] && [ "$v4" == '1' ] && 
[ "$v5" == '1' ] && [ "$v6" == '1' ] && [ "$v7" == '1' ] && [ "$v8" == '1' ] && 
[ "$v9" == '1' ] && [ "$v10" == '1' ] && [ "$v11" == '1' ] && [ "$v12" == '1' ] && [ "$v13" == '1' ] && [ "$v14" == '1' ] && [ "$v15" == '1' ]; then
echo 1
else
echo 0
fi

;;
*) echo "Wrong service selection number | $1 is not processed"
   ;;
esac
