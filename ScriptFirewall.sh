#!/bin/bash

iptables -P INPUT DROP

iptables -A INPUT -p tcp --dport 22 -j ACCEPT   

iptables -A INPUT -m state --state NEW -p tcp --dport 80 -j ACCEPT

iptables -A INPUT -m state --state NEW -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -s  $IP -j ACCEPT

iptables -A  INPUT -m mac --mac-source $MAC -j ACCEPT 

iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT

iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

iptables -A INPUT -p tcp --dport 21 -j ACCEPT

iptables -A INPUT -p tcp --dport 25 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT


iptables -A INPUT -p tcp --dport 143 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT



iptables -F INPUT
