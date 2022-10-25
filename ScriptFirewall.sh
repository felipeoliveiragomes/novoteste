#!/bin/bash

iptables -P INPUT DROP

iptables -A INPUT -p tcp --dport 22 -j ACCEPT   
iptables -A INPUT -p tcp --sport 22 -j ACCEPT   

iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -p tcp --sport 80 -j ACCEPT

iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -p tcp --sport 443 -j ACCEPT

iptables -A INPUT -s  $IP -j ACCEPT
iptables -A INPUT -d  $IP -j ACCEPT


iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT


iptables -A INPUT -p tcp --dport 25  -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25  -j ACCEPT



iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 143  -j ACCEPT



iptables -F INPUT


#https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
#https://serverfault.com/questions/38398/allowing-ftp-with-iptables
#https://www.cyberciti.biz/tips/linux-iptables-9-allow-icmp-ping.html
