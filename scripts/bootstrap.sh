#!/bin/bash

cip=$(hostname -i)
hostname $cip
echo $cip > /etc/hostname
sed '/'$cip'/d' /etc/hosts > /tmp/hosts	
echo "" > /etc/hosts
cat /tmp/hosts > /etc/hosts
echo "$cip $cip" >> /etc/hosts

#nameserver=$(cat /etc/resolv.conf  | grep nameserver | awk '{print $2}')
#echo "server=$nameserver" >> /etc/dnsmasq.conf
#
#service dnsmasq start
#echo "" > /etc/resolv.conf
#echo "nameserver 127.0.0.1" >> /etc/resolv.conf

service ntpd start

if [ $1 = "server" ]
then
    echo "Start ambari server"
    /scripts/setup_server.sh
    /scripts/start_server.sh
    AMBARI_SERVER=localhost
    sed -i "s/HOSTNAME/$AMBARI_SERVER/" /etc/ambari-agent/conf/ambari-agent.ini
    service ambari-agent restart
fi	

echo "Start ambari agent"
sed -i "s/HOSTNAME/$AMBARI_SERVER/" /etc/ambari-agent/conf/ambari-agent.ini
service ambari-agent restart
tail -f /var/log/ambari-agent/ambari-agent.log
