# Автозагрузка в linux

## Пользовательский

`~/.config/autostart` - автозапуск приложений. `.desktop`-файлы можно запустать так: `gio launch ~/.config/autostart/Yandex.Disk.desktop`

~/.bashrc - пользовательский
/etc/init.d

## Общий (root)

/etc/rc.local

sudo chmod +x /etc/init.d/myscript.sh
sudo update-rc.d myscript.sh defaults
http://jonathonhill.net/2009-04-23/auto-start-a-shell-script-on-ubuntu-server/
xinput --set-prop "Logitech USB Optical Mouse" 264 1.2

## Графический Startup

интерфейс Applications

+ доп. варианты:
http://askubuntu.com/questions/48321/how-do-i-start-applications-automatically-on-login

## Алиасы

Добавить в .zhrc и .bashrc:

if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

Пример алиасов:
alias ls='ls --color=auto'
alias grep='grep --color=auto'

## PS1 для zsh

bkup: PS1=$'%K{blue}%n@%m%k %B%F{cyan}%(4~|...|)%3~%F{white} %# %b%f%k'

PS1=$'[%T] %m@%n (%/)$'
PS1=$'[%T] %m@%n (%#)$'
# outputs: [Time24h] host@user (pwd)$
http://www.understudy.net/custom.html


## Управление службами

```
sudo apt install rcconf
sudo rcconf
```

upstart jobs - `/etc/init/`
systemd services - `/lib/systemd`

# Сравнение нового systemd со старым upstart

https://wiki.ubuntu.com/SystemdForUpstartUsers

# systemd

`systemctl`

`SysV?`

# Upstart force enable service autostart

```
cd /etc/systemd/system/multi-user.target.wants
sudo ln -s ../mysql.service mysql.service
```
