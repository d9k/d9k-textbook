VirtualBox additions
--------------------

/etc/apt/sources.list:
deb http://http.kali.org/kali kali main contrib non-free
deb http://security.kali.org/kali-security kali/updates main contrib non-free
#When done it's probably wise to remove the extra line:
deb http://snapshot.debian.org/archive/debian/20130201T032911Z/ experimental main contrib non-free

apt-get -o Acquire::Check-Valid-Until=false update

apt-get install build-essential module-assistant linux-headers-$(uname -r)
apt-get install -y linux-headers-$(uname -r)

cd /media/cdrom # or mnt point for additions

sh VBoxLinuxAdditions.run

https://forums.kali.org/showthread.php?5804-Kernel-headers-problem
https://forums.kali.org/showthread.php?19935-Solving-linux-headers-3-7-trunk-amd64-not-found