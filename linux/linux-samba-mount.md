(21:40:16) Жеха Иванов: разобрался вот,
mount -t cifs //192.168.0.101/video ~/smb/video -o user=workgroup/user%password

//192.168.0.101/video - расшаренный на винде ресурс
~/smb/video              - предварительно созданная папка, куда бем монтировать
workgroup/user%password - рабочая группа в которой находиться комп с виндой
                                           пользователь и пароль на компе с виндой

(21:41:17) Жеха Иванов: выполняю под sudo в скрипте, сам скрипт запихал в .bash_profile