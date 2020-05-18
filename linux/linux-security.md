# Linux security

As root or via sudo, type this to see all failed login attempts

    $sudo cat /var/log/auth.log | grep 'sshd.*Invalid'

#If you want to see successful logins, type this

    $sudo cat /var/log/auth.log | grep 'sshd.*opened'

## fail2ban

http://www.rackspace.com/knowledge_center/article/fail2ban
https://www.digitalocean.com/community/articles/how-to-protect-ssh-with-fail2ban-on-ubuntu-12-04

## open port

see linux_iptables.txt

## Linux password "pass" manager

http://www.tricksofthetrades.net/2015/07/04/notes-pass-unix-password-manager/
