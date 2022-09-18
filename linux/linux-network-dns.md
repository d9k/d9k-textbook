# Команды по работе с DNS сети linux

## Проверка конфигурации

`cat /etc/resolv.conf`

`sudo service systemd-resolved restart; systemd-resolve --flush-caches`

- `sudo service systemd-resolved status`
- `journalctl --unit systemd-resolved`
- `resolvconf`
- `systemd-resolved`
- `systemd-resolve --status`

- Конфиги
  - написано не редактировать
    - `/etc/resolvconf/resolv.conf.d/original`
    - `/etc/resolv.conf`
    - `/etc/network/interfaces.d/50-cloud-init.cfg`

- ещё бывают
  - `systemd-networkd`

- Журналы
  - `/var/log/cloud-init.log`

- Проверка
  - `dig google.com`

## dig


- The `NXDOMAIN` is a DNS message type received by the DNS resolver (i.e. client) when a request to resolve a domain is sent to the DNS and cannot be resolved to an IP address.

- The `Authority` section indicates the server(s) that are the ultimate authority for answering DNS queries about that domain.

## Network manager

```
nmcli con down $connectionName
nmcli con up $connectionName
```
