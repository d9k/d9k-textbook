iptables

show rules
----------
iptables -L -v -n | more

ssh
---
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

http://www.thegeekstuff.com/2011/03/iptables-inbound-and-outbound-rules/
http://www.thegeekstuff.com/2011/06/iptables-rules-examples/