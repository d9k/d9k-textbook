perl: warning: Setting locale failed.
-------------------------------------
$ locale-gen en_US en_US.UTF-8 ru_RU ru_RU.UTF-8
$ localedef -v -c -i en_US -f UTF-8 en_US.UTF-8
$ sudo dpkg-reconfigure locales

$ vim /etc/defaults/locale
LANG="en_US.UTF-8"
LANGUAGE="en_US:en"

Saved it and locale -a

## Debian: bash cannot change locale en_US.UTF-8

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen en_US.UTF-8
