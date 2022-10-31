iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD


# Para liberar o SSH
iptables -A INPUT -p tcp --dport 22 -j ACCEPT   
iptables -A OUTPUT -p tcp --sport 22 -j ACCEPT   


#Para Liberar HTTP
iptables -A INPUT  -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 80 -j ACCEPT

#Para liberar o HTTPS
iptables -A INPUT  -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 443 -j ACCEPT


#para liberar a requisiscao de icmp

iptables -A INPUT -p icmp  -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT



#para liberar FTP
iptables -A INPUT -p tcp --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 20 -j ACCEPT

#Para liberar o SMTP
iptables -A INPUT -p tcp --dport 25  -j ACCEPT
iptables -A OUTPUT -p tcp --sport 25  -j ACCEPT


#Para liberar o IMAP
iptables -A INPUT -p tcp --dport 143 -j ACCEPT
iptables -A OUTPUT -p tcp --sport 143  -j ACCEPT



# para liberar o loopback
iptables -t nat -A POSTROUTING -o lo -j ACCEPT

#para armazenar o log das cadeias
iptables -A INPUT -j LOG --log-prefix "FIREWALL: INPUT "
iptables -A OUTPUT -j LOG --log-prefix "FIREWALL: INPUT "
iptables -A FORWARD -j LOG --log-prefix "FIREWALL: FORWARD "

#Realiza os DROP
iptables -P  INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

