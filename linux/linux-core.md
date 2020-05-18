Ядро linux
==========

## лог загрузки

До ubuntu 16: `/var/log/boot.log`

После ubuntu 16: `journalctl -b0 --system _COMM=systemd`