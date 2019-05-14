#!/bin/bash
processnap1=$(ps -eo pid,cmd,%mem,%cpu --sort=-%cpu | head)
processnap2=$(ps -eo pid,cmd,%mem,%cpu --sort=-%mem | head)
inode=$(df -i |grep /dev/xvda1 |awk '{print $5}' |rev | cut -c 2- | rev)
mem=$(free | awk 'FNR == 2 {print $3/($2)*100}')
#mem=$(free -m | awk 'FNR == 2 {print ($3-$7-$6)/($2)*100}')
#tab='       '
diskuse=$(df -h |grep /dev/xvda1 |awk '{print $5}' |rev | cut -c 2- | rev)
loadavg=$(uptime)
#numcores=$(echo Total-Number-of-CPU-Cores = $(( $(lscpu | awk '/^Socket/{ print $2 }') * $(lscpu | awk '/^Core/{ print $4 }') )))
numcores=$(echo Total-Number-of-CPU-Cores = $(cat /proc/cpuinfo | grep processor | wc -l))
echo "Number of process Running:$(ps -aux |wc -l)"
echo "Memory-usage %:$mem"
echo "Inode-Usage % :$inode"
echo "Disk-Usage %:$diskuse"
echo "$numcores"
echo "Uptime,Number-of-users,Load-average:$loadavg"
echo "---------------------------------------------------------------------- "
echo "Top CPU Consuming Process "
echo "---------------------------------------------------------------------- "
echo "$processnap1"
echo "---------------------------------------------------------------------- "
echo "Top Memory Consuming Process "
echo "---------------------------------------------------------------------- "
echo "$processnap2"
