Починка сна в Linux
===================

## Ubuntu enable hiberbate

`/var/lib/polkit-1/localauthority/10-vendor.d/com.ubuntu.desktop.pkla`

1) Найти строки

`[Disable hibernate by default in upower]`
`[Disable hibernate by default in logind]`

2) Заменить `ResultActive=no` на `ResultActive=yes` на несколько строк ниже в обоих случаях.

## grub resume swap trick

at `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="resume=UUID=......-......."
```

UUID взять отсюда: `tail -n -9 /proc/swaps | cut -d ' ' -f 1 | xargs sudo blkid`

затем `sudo update-grub`

## install tux on ice

```
sudo add-apt-repository ppa:tuxonice/ppa
sudo apt-get update
sudo apt-get install uswsusp linux-generic-tuxonice tuxonice-userui
```

uninstall

```
sudo apt-get --purge remove tuxonice-userui linux-generic-tuxonice linux-headers-generic-tuxonice uswsusp
sudo apt-get --purge remove tuxonice\*
```

http://askubuntu.com/questions/161966/how-do-i-uninstall-the-tuxonice-kernel-in-12-04

http://www.pauljoyceuk.com/codex/2012/howto-make-ubuntu-12-04-hibernate-successfully/

Boot repair (not tested)
------------------------

```
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair
boot-repair
```