# Рецепты git

## Stage file partially

```
git add -i --patch path/to/file
```

## Обновить скачанный репозиторий

    git fetch origin && git reset --hard origin/master

## Show untracked files

https://stackoverflow.com/a/4855096/1760643

List ignored files

`$ git ls-files . --ignored --exclude-standard --others`

List untracked files

`$ git ls-files . --exclude-standard --others`

## Remove from repo without deletion

`git rm -rf --cached $FILES`

## Remove large file from repo history

### With filter branch

```
git filter-branch --tree-filter 'rm path/to/your/bigfile' HEAD
git push origin master --force
```

https://freek.dev/879-how-to-remove-a-big-file-wrongly-committed-to-a-git-repo

### With BFG

Download jar
https://rtyley.github.io/bfg-repo-cleaner/

make envelope script `bfg`:

`java -jar .../bfg-....jar $@`

Переписать коммиты в истории:

`bfg --delete-files myVideo.mp4`

Освободить место из папки `.git`:
`git reflog expire --expire=now --all && git gc --prune=now --aggressive`


## Merge with discarding remote changes

`git merge -s ours`

## Merge repo to subfolder

### 1) Rewrite repo2 history

```
$ git filter-branch -f --prune-empty --tree-filter '
  dir="web/new-landing-maquette"
  mkdir -p "$dir"
  git ls-tree --name-only $GIT_COMMIT | xargs -I files mv files "$dir"
'
```

https://unix.stackexchange.com/questions/280217/how-to-replay-git-repository-history-into-subdirectory

### 2) Pull repo2 to repo1

git pull --allow-unrelated-histories file:///home/user/myrepo2 myrepo2-branch

## List remote branches

`git ls-remote`

## Conditional include config

```
[includeIf "gitdir:~/work/"]
path = .gitconfig-work
```

- https://github.blog/2017-05-10-git-2-13-has-been-released/#conditional-configuration
- https://stackoverflow.com/a/46239540/1760643
