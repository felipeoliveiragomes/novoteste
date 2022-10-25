#!/bin/bash

iptables -P  INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD


# Para liberar o SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT   


#Para Liberar HTTP
iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -p tcp --sport 80 -j ACCEPT

#Para liberar o HTTPS
iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -m state --state NEW -p tcp --sport 443 -j ACCEPT


#para liberar a requisiscao de icmp

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

#Para liberar a resposta de icmp
iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

#para liberar FTP
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT

#Para liberar o SMTP
iptables -A INPUT -p tcp --dport 25  -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25  -j ACCEPT


#Para liberar o IMAP
iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 143  -j ACCEPT






#https://www.digitalocean.com/community/tutorials/iptables-essentials-common-firewall-rules-and-commands
#https://serverfault.com/questions/38398/allowing-ftp-with-iptables
#https://www.cyberciti.biz/tips/linux-iptables-9-allow-icmp-ping.html
#https://serverfault.com/questions/163111/allow-traffic-to-from-specific-ip-with-iptables
