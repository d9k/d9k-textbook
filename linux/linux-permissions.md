# Права пользователей Linux

## Найти все файлы, не принадлежащие пользователю

`find . \! -user foo -print`

## Добавить пользователя

`$ useradd -m -s /usr/bin/zsh USER_NAME`

(-s /bin/bash для оболочки bash)

(-m = --create-home)
(-s = --shell)

    passwd USER_NAME

## Добавить пользователя в sudo

`/etc/sudoers`:

    USER_NAME    ALL=(ALL) ALL

## Изменить пароль пользователя

    passwd USER_NAME

## Изменить shell

    sudo usermod -s /bin/bash USERNAME

## Узнать, каким группам принаджежит пользователь

`groups USERNAME`


## Добавить пользователя в группу

    #existing user
    $usermod -a -G {group-name} username

    #new user
    $useradd -G {group-name} username

http://www.cyberciti.biz/faq/howto-linux-add-user-to-group/

(нужна перезагрузка)

## Пользоваться правами новой добавленной группы без перезагрузки

	su - $USER

http://superuser.com/questions/272061/reload-a-linux-users-group-assignments-without-logging-out

## Изменить владельца папки

    chown -R USER:GROUP folder

## Запустить команду под другим пользователем

`sudo -H -u otheruser bash -c 'echo "I am $USER, with uid $UID, home $HOME"'`

'-H' homedir of target user (otheruser)

### Передать переменную в окружение запускаемой команды

sudo TEST_VAR='rgrrrg' ...

## Нужный владелец у новых файлов

`find /path/to/directory -type d -exec chmod g+s '{}' \;`

(можно вместо `/path/to/directory` написать `pwd` (в обратных кавычках))

чтобы все вложенные файлы в директории создавались с правами на группу и владельца как у этой папки

http://unix.stackexchange.com/a/166000/48167

Можно выставлять ТОЛЬКО права группы через stricky bit (!)

## sudo: command not found when using sudo

[Daniel Beck](http://superuser.com/users/22317/daniel-beck):

`$PATH` is evaluated by your shell, so your check doesn't work as you expect it to.

`/etc/sudoers` is configured to replace your PATH with a default one.

sudo does not load a login shell environment before executing the command, so the default PATH from /etc/sudoers is used. su - does open a login shell, which involves loading /etc/profile. See man bash, section INVOCATION.

Just remove the PATH reset in `/etc/sudoers`. It's likely a rule called secure_path.

[SU question](http://superuser.com/questions/709515/command-not-found-when-using-sudo

## Добавление в файл от sudo-пользователя

`tee` либо

`sudo sh -c 'echo "deb http://deb.opera.com/opera-stable/ stable non-free" >> /etc/apt/sources.list.d/opera.list`

## Редактирование файлов в Linux Mint

`xed admin:///etc/fstab`



## sudo for GUI applications (pkexec)

Example with `meld`:

+ `/usr/share/polkit-1/actions/meld.policy`:

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE policyconfig PUBLIC
 "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
 "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">

<policyconfig>

  <action id="org.freedesktop.policykit.pkexec.run-meld">
    <description>Run Meld</description>
    <message>Authentication is required to run Meld</message>
    <defaults>
      <allow_any>no</allow_any>
      <allow_inactive>no</allow_inactive>
      <allow_active>auth_admin_keep</allow_active>
    </defaults>
    <annotate key="org.freedesktop.policykit.exec.path">/usr/bin/meld</annotate>
    <annotate key="org.freedesktop.policykit.exec.allow_gui">TRUE</annotate>
  </action>

</policyconfig>
```


`pkexec meld $(pwd)/php.ini /etc/php/7.3/apache2/php.ini`

https://askubuntu.com/a/641616/156571

## Login as www-data

sudo su -s /bin/bash www-data

## Unable to handle admin: locations

`sudo apt install gvfs-backends`
