#!/bin/bash

#set -x
all_chk ()
{
v1=$(service alert-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v2=$(service battery-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v3=$(service checkout-selfassign-reset-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v4=$(service dali-add-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v5=$(service hardware-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v6=$(service inactive-assets-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v7=$(service median-and-proximity-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v8=$(service node-monitor-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v9=$(service node-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v10=$(service node-websocket-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v11=$(service operate-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v12=$(service ota-hash-request-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v13=$(service ota-progress-request-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v14=$(service proximity-history-update-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v15=$(service redis-remote-operation-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v16=$(service rule-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v17=$(service sensor-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v18=$(service smart-tag-action-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v19=$(service tag-extra-data-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v20=$(service tamper-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v21=$(service transfer-request-expiry-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v22=$(service triangulation-history-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v23=$(service zone-rule-hit-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v24=$(service bridgesocket status | grep running |grep process >/dev/null && echo 1 || echo 0)
v25=$(service dali-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
v26=$(service alert-rule-hit-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0)
}


case "$1" in
	1)
	#alert-cache-service
service alert-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	2)
	#battery-alert-service
service battery-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	3)
	#checkout-selfassign-reset-service status
service checkout-selfassign-reset-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	4)
	#dali-add-cache-service
service dali-add-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	5)
	#hardware-alert-service
service hardware-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	6)
	#inactive-assets-alert-service
service inactive-assets-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	7)
	#median-and-proximity-cache-service
service median-and-proximity-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	8)
	#node-monitor-service
service node-monitor-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	9)
	#node-service
service node-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	10)
	#node-websocket-service
service node-websocket-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	11)
	#operate-cache-service
service operate-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	12)
	#ota-hash-request-service
service ota-hash-request-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	13)
	#ota-progress-request-service
service ota-progress-request-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	14)
	# proximity-history-update-service
service proximity-history-update-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	15)
	#redis-remote-operation-service
service redis-remote-operation-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	16)
	#rule-alert-service
service rule-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	17)
	#sensor-cache-service
service sensor-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	18)
	#smart-tag-action-service
service smart-tag-action-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	19)
	#tag-extra-data-service
service tag-extra-data-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	20)
	#tamper-alert-service
service tamper-alert-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	21)
	#transfer-request-expiry-service
service transfer-request-expiry-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	22)
	#triangulation-history-cache-service
service triangulation-history-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	23)
	#zone-rule-hit-cache-service
service zone-rule-hit-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	24)
	#bridgesocket
service bridgesocket status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	25)
	#dali-service
service dali-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	
	26)
	#alert-rule-hit-cache-service
service alert-rule-hit-cache-service status | grep running |grep process >/dev/null && echo 1 || echo 0
;;
	all)
	#all-services-check
all_chk
#v27=1
if [ "$v1" == '1' ] && [ "$v2" == '1' ] && [ "$v3" == '1' ] && [ "$v4" == '1' ] && 
[ "$v5" == '1' ] && [ "$v6" == '1' ] && [ "$v7" == '1' ] && [ "$v8" == '1' ] && 
[ "$v9" == '1' ] && [ "$v10" == '1' ] && [ "$v11" == '1' ] && [ "$v12" == '1' ] && 
[ "$v13" == '1' ] && [ "$v14" == '1' ] && [ "$v15" == '1' ] && [ "$v16" == '1' ] && 
[ "$v17" == '1' ] && [ "$v18" == '1' ] && [ "$v19" == '1' ] && [ "$v20" == '1' ] && 
[ "$v21" == '1' ] && [ "$v22" == '1' ] && [ "$v23" == '1' ] && [ "$v24" == '1' ] && 
[ "$v25" == '1' ] && [ "$v26" == '1' ]; then
echo 1
else
echo 0
fi

;;
*) echo "Wrong service selection number | $1 is not processed"
   ;;
esac
