# Docker

## Установка

(устар., см. `docker-install.md`!)

	sudo apt-get install docker.io
	ln -s /usr/bin/docker.io /usr/bin/docker

[туториал на liquidweb](http://www.liquidweb.com/kb/how-to-install-docker-on-ubuntu-14-04-lts/)

## Манипулирование службой docker

```
sudo service docker.io [status/start/stop]
```

## Проблема с запуском mysql

http://muehe.org/posts/switching-docker-from-aufs-to-devicemapper/


## Подключение к терминалу

http://stackoverflow.com/questions/20932357/docker-enter-running-container-with-new-tty

```
docker ps
```

## Volume mount permissions

```bash
docker \
    --user $(id -u) --env UID=$(id -u) --env GID=$(id -g) \
    -v /host/folder/path:/container/folder/path
```