# Файловая система

## Force unmount

```
umount -l /PATH/OF/BUSY-DEVICE
umount -f /PATH/OF/BUSY-NFS (NETWORK-FILE-SYSTEM)
```

- :speech_balloon: [linux - How to unmount a busy device | SO](https://stackoverflow.com/questions/7878707/how-to-unmount-a-busy-device/19969471#19969471)

## Найти девайсы

```
sudo fdisk -l

sudo blkid
```

## Автомонтирование

```
/etc/fstab
```

## Symlink to partition mount

https://askubuntu.com/a/1342479/156571

My problem was `cannot perform operation: mount --rbind /var/snap /tmp/snap.rootfs_7keS1C//var/snap: Permission denied`

I had /var_snap linked to /var/snap (made with `ln -s`) becouse of the low space on `/var` partition.

Solution:
1) `sudo unlink /var/snap`
2) `sudo mkdir /var/snap`
3) `sudo mount --bind /var_snap /var/snap` - check if snap application starts after this
4) Add line to the `/etc/fstab`:

```
/var_snap /var/snap auto  defaults,nofail,nobootwait,bind 0 2
```

5) reboot
