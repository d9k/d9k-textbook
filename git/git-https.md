# Git: HTTPS

### Задание отдельного пароля для Git

Personal access tokens для задания пароля отличного от общего пароля к инфраструктуре:

[https://confluence.atlassian.com/bitbucketserver076/personal-access-tokens-1026534797.html](https://confluence.atlassian.com/bitbucketserver076/personal-access-tokens-1026534797.html)

`Profile picture > Manage account > Personal access tokens`

### Запоминание HTTPS-пароля на ограниченного время

(сработает и при использовании токета)

[https://git-scm.com/docs/git-credential-cache](https://git-scm.com/docs/git-credential-cache)

Находясь в папке с нужным репозиторием выполнить команду:

```bash
git config credential.helper 'cache --timeout 1800'
```

— включение кэша паролей с памятью на 60 секунд * 10 минут = 1800 секунд

### Сбросить кэш HTTP-паролей

```bash
git credential-cache exit
```