#!/bin/bash 
rpm -Uvh http://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm 
yum -y install zabbix-agent zabbix-sender 
sed -i 's/Server=127.0.0.1/#Server=127.0.0.1/g' /etc/zabbix/zabbix_agentd.conf 
sed -i 's/ServerActive=127.0.0.1/#ServerActive=127.0.0.1/g' /etc/zabbix/zabbix_agentd.conf 
echo "#############################" 
echo "######Zabbix Server IP#######" 
echo "#############################" 
echo "Server=175.45.194.199" >> /etc/zabbix/zabbix_agentd.conf 
echo "ServerActive=175.45.194.199:10051" >> /etc/zabbix/zabbix_agentd.conf 
echo "#############################" 
echo "####### HOSTMetadata #######" 
echo "#############################" 
echo "HostMetadata=" >> /etc/zabbix/zabbix_agentd.conf 
sed -i 's/Hostname=Zabbix server/Hostname='"CentCent"'/g' /etc/zabbix/zabbix_agentd.conf 
cat /etc/zabbix/zabbix_agentd.conf | grep 'Server' 
cat /etc/zabbix/zabbix_agentd.conf | grep 'Hostname=' 
cat /etc/zabbix/zabbix_agentd.conf | grep 'HostMetadata=' 
systemctl start zabbix-agent 
systemctl enable zabbix-agent 
systemctl status zabbix-agent