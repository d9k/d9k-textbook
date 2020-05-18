# Git clone or fetch

## Git clone single branch to empty repo

fetch only this branch

`git clone --single-branch -b branch repo_url destination_dolder`

all branches:

`git clone -b branch repo_url destination_dolder`


## Git fetch several remote branches

https://stackoverflow.com/a/15508750/1760643

`.git/config`:

```
[remote "origin"]
	url = your_git_url
	fetch = +refs/heads/branch_A:refs/remotes/origin/branch_A
	fetch = +refs/heads/branch_B:refs/remotes/origin/branch_B

[branch "branch_A"]
	remote = origin
	merge = refs/heads/branch_A

[branch "branch_B"]
	remote = origin
	merge = refs/heads/branch_B

```

## Deprecated:

https://stackoverflow.com/a/27792437/1760643

```
[branch "new_branch"]
	remote = origin
	merge = refs/heads/new_branch
```

```
git fetch <remote_name> <branch_name>
# git checkout FETCH_HEAD
# git branch <branch_name>
# git remote set-branches <remote-name> <branch-name>
```
