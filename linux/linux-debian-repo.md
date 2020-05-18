> How to enable contrib and non-free repo in Debian
---------------------------------------------------

sudo nano /etc/apt/sources.list

Then add ‘contrib’ and ‘non free’ at the end of each line that begins with “deb” and “deb-src” just like the example:
	
deb http://http.us.debian.org/debian squeeze main contrib non-free
deb http://security.debian.org squeeze/updates main contrib non-free

Save the file, and run ‘apt-get update‘ and optionally ‘apt-get upgrade‘ to activate the changes.

apt-fast
--------
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install apt-fast

(?) sudo apt-get install software-properties-common

Добавление add-apt-repository
-----------------------------
wget http://blog.anantshri.info/wp-content/uploads/2010/09/add-apt-repository.sh.txt
или
wget http://www.debuntux.kz/wordpress/wp-content/uploads/2011/08/add-apt-repository.sh.txt
sudo cp add-apt-repository.sh.txt /usr/sbin/add-apt-repository
sudo chmod 755 /usr/sbin/add-apt-repository

http://www.debuntux.kz/?p=371


deb: command not found
----------------------
deb - не команда. Надо дописывать в конец файла /etc/apt/sources.list и запускать `apt-get update`

добавление ключа pgp
--------------------
Если при выполнении `sudo apt-get update` возникает ошибка 
	GPG error: http://*** stable Release: The following signatures couldn't be verified because the public key is not available: NO_PUBKEY ***
, нужно добавить ключ, например
$wget www.dotdeb.org/dotdeb.gpg
$cat dotdeb.gpg | sudo apt-key add -
OK
$sudo apt-get update

show package info
-----------------
sudo apt-cache search ^emacs 
sudo apt-cache  show emacs23-nox