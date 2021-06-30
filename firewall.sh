
#!/bin/bash




ifconfig


read -p "Please choose a Public interface: " int1
read -p "Please choose internal Interface: "  int2

firewall-cmd --add-interface=$int2 --zone=internal --permanent
firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o $int1 -j MASQUERADE
firewall-cmd --zone=public --add-masquerade --permanent


firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i $int2 -o $int1 -j ACCEPT
firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 -i $int1 -o $int2 -m state --state RELATED,ESTABLISHED -j ACCEPT

firewall-cmd --permanent --add-port=53/tcp --zone=internal
firewall-cmd --permanent --add-port=53/udp --zone=internal


cat /proc/sys/net/ipv4/ip_forward
sysctl -w net.ipv4.ip_forward=1
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -p /etc/sysctl.conf
chgrp named -R /var/named
chown -v root:named /etc/named.conf
restorecon -rv /var/named

firewall-cmd --reload
