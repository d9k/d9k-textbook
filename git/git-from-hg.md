# Конвертация hg в git

Нужна версия hg не ниже 4.6

`sudo -H pip2 install "mercurial==4.6"`

https://git-scm.com/book/en/v2/Git-and-Other-Systems-Migrating-to-Git

`hg log | grep user: | sort | uniq | sed 's/user: *//' > ../authors`

```
git init
hg-fast-export.sh -r hg_repo -A ./authors`
```

`git commit --amend --author="me <me@example.com>" --no-edit`

## Fix `nulInCommit: NUL byte in the commit object body`

```
$ git init ../new-repo
$ git fast-export --all | (cd ../new-repo && git fast-import && git checkout)
```

https://stackoverflow.com/a/60846882/1760643
