# Docker proxy

- :speech_balloon: [Use socks5 proxy from host for docker build | SO](https://stackoverflow.com/questions/61590317/use-socks5-proxy-from-host-for-docker-build)
- :speech_balloon: [Proxy configuration | Docker Docs](https://docs.docker.com/engine/cli/proxy/)

## Use proxy for git SSH inside docker

Для случая, когда BitBucket не работает без прокси, и прокси запущен, например, на `127.0.0.1:2080`.

При выполнении `ci` возникает ошибка вида `The process "'git' 'clone' '--mirror' '--' 'git@bitbucket.org:inlearno/booking-components.git' '/root/.composer/cache/vcs/git-bitbucket.org-inlearno-booking-components.git/'" exceeded the timeout of 300 seconds`.

### SSH-ключ с паролем

Нужно пробросить ssh-agent с хоста в контейнер.

[How to SSH agent forward into a docker container](https://gist.github.com/d11wtq/8699521?permalink_comment_id=1233903#gistcomment-1233903)

Хост-конфигурация `~/.ssh/config`:

```
Host bitbucket.org
    ProxyCommand /usr/bin/nc -x 127.0.0.1:2080 %h %p
```

Скопировать в `./ssh/config`, удалить лишнее, `127.0.0.1` заменить на `host.docker.internal`.

`docker-compose.yml`:

- Под `navi`
	- `environment`
		- + `SSH_AUTH_SOCK: /ssh-agent`
	- `volumes`
		- + `${SSH_AUTH_SOCK}:/ssh-agent`

```
docker compose stop
docker compose build --no-cache && docker compose up -d
```

В случае ошибки

```
docker compose rm
```

и перезапустить сборку заново.

Добавить ключ снаружи:

```
ssh-add ~/.ssh/your-key
```

ввести пароль от ключа.

Проверить, что ключ доступен внутри контейнера:

```
docker compose exec navi ssh-add -l
```

В комплекте поставки Alpine Linux урезанная версия `nc`, не поддерживающая прокси, надо поставить `OpenBSD`-версию.

```
docker compose exec navi apk add netcat-openbsd
```

По-умолчанию таймаут большой, 10 минут, поэтому сначала стоит запустить с меньшим таймаутом, чтобы быстро увидеть ошибку с прокси:

```
docker compose exec --env COMPOSER_PROCESS_TIMEOUT=20 navi bash -i -c "ci"
```
