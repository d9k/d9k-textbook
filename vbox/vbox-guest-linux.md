# VirtualBox: guest linux

## linux guest additions build fail

http://askubuntu.com/questions/22743/how-do-i-install-guest-additions-in-a-virtualbox-vm
https://apps.ubuntu.com/cat/applications/build-essential/

## ssh

```
sudo apt-get remove --purge openssh-server
sudo apt-get install openssh-server

/etc/ssh/sshd_config
```

The best way to login to a guest Linux VirtualBox VM is port forwarding. By default, you should have one interface already which is using NAT. Then go to the Network settings and click the Port Forwarding button. Add a new Rule:

Host port 3022, guest port 22, name ssh, other left blank.

stackoverflow.com/questions/5906441/how-to-ssh-to-a-virtualbox-guest-externally-through-a-host?rq=1