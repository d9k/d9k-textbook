# Linux GRUB

## Сообщения вместо лого при загрузке

В `/etc/default/grub` поменять

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
    
на

```
GRUB_CMDLINE_LINUX_DEFAULT=""
```

Затем `sudo update-grub`