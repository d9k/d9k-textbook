# Команды по работе с сетью linux

## Test physical level

ethtool eth0

## Reset connection

sudo service network-manager restart

## Restart low-level

	ifconfig eth0 down && ifconfig eth0 up

## Синхронизация по ftp

	#!/bin/bash
	HOST="your.ftp.host.dom"
	USER="username"
	PASS="password"
	FTPURL="ftp://$USER:$PASS@$HOST"
	LCD="/path/of/your/local/dir"
	RCD="/path/of/your/remote/dir"
	#DELETE="--delete"
	lftp -c "set ftp:list-options -a;
	open '$FTPURL';
	lcd $LCD;
	cd $RCD;
	mirror --reverse \
	       $DELETE \
	       --verbose \
	       --exclude-glob a-dir-to-exclude/ \
	       --exclude-glob a-file-to-exclude \
	       --exclude-glob a-file-group-to-exclude* \
	       --exclude-glob other-files-to-exclude"

Без `--reserve` выкачивает, а не закачивает

Можно добавить параметры `--only-newer --ignore-time`, чтобы синхронизировались только изменённые файлы (отличающиеся по размеру).

http://serverfault.com/a/106365/155512

### Вариант 2

CurlFtpFs (?)


## Медленно работающие обращения к localhost

(FQDN fix) `/etc/hosts`:

поменять

	127.0.0.1       localhost
	127.0.1.1       debian

на

	127.0.0.1       localhost.localdomain localhost debian
	127.0.1.1       debian


## Слежение за трафиком

iftop
iptraf

см. http://www.cyberciti.biz/tips/top-linux-monitoring-tools.html

## Порты

	netstat -tulpn | grep :8000

## Скачать несколько файлов с помощью Wget

	xargs -i wget 'http://{}'  < your_files_list.txt


## Держать порт ssh открытым

1) через ssh

+ `-o "ServerAliveInterval 180"`

https://support.asperasoft.com/entries/20150692-Set-up-permanent-SSH-tunnel-via-cron

2) через autossh

	sudo apt-get install autossh
	autossh -f -p52078 -M 5122 -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -L 220:127.0.0.1:1234 remote_user@remote_host_ip -N
	# 20000 - status port, 1234 - remote port, 220 - local port

## Linux startup: “waiting for network configuration” disable

Add a # in the /etc/init/failsafe.conf file in front of all lines containing sleep <n>. Doing so would help to boot fast.


## VitualBox: configure static ip


1) Bridged adapter

2) `sudo nano /etc/network/interfaces`

	auto eth0
	iface eth0 inet static
	address 192.168.1.115
	netmask 255.255.255.0
	gateway 192.168.1.1
	dns-nameservers 8.8.8.8 192.168.1.1


## Run app without net

(and all it's child subprocesses)

```
sudo groupadd nonet
sudo adduser $USER nonet
sudo iptables -A OUTPUT -m owner --gid-owner nonet -j REJECT
# refresh groups without reboot:
su - $USER
sg nonet app-to-run
```

then

`sudo iptables-save`

to restore rules after reboot

## Обновление DHCP

```
$ sudo dhclient -r eth0
$ sudo dhclient eth0
```

## Check port is open

`sudo netstat -putan | grep kurento`

`lsof -i :80`

## Get router ips

`netstat -nr | awk '$1 == "0.0.0.0"{print$2}'`

## Потребление трафика приложений

```
sudo apt-get install nethogs
sudo nethogs wlan0
```
