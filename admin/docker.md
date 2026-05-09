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

## How to run 2 commands with docker exec | SO

https://stackoverflow.com/questions/33416286/how-to-run-2-commands-with-docker-exec/58037687#58037687

```bash
cat <<EOF | docker exec --interactive boring_hawking sh
cd /var/log
tar -cv ./file.log
EOF
```

Also `-w` option to specify the working directory:

```
docker exec -w /var/log boring_hawking tar -cv ./file.log
```

## How can I delete Docker images by tag, preferably with wildcarding? | SO

https://stackoverflow.com/questions/32490229/how-can-i-delete-docker-images-by-tag-preferably-with-wildcarding/32491527#32491527

```bash
(docker images | grep stuff_ | tr -s ' ' | cut -d ' ' -f 2 | xargs docker image rm
```