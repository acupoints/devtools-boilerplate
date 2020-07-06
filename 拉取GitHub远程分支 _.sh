### 本地有未提交的文件时也可使用
### 注意查看有无冲突文件，当心同名覆盖
###############################################
## 查看所有分支
git branch --all

## $ git branch --all
##   help
## * master
##   remotes/origin/HEAD -> origin/master
##   remotes/origin/master

## 查看远程连接
git remote --verbose

## $ git remote --verbose
## origin  https://github.com/acupoints/pyqt5-boilerplate.git (fetch)
## origin  https://github.com/acupoints/pyqt5-boilerplate.git (push)

## 拉取远程分支
git fetch origin master

## $ git fetch origin master
## remote: Enumerating objects: 14, done.
## remote: Counting objects: 100% (14/14), done.
## remote: Compressing objects: 100% (8/8), done.
## remote: Total 11 (delta 1), reused 11 (delta 1), pack-reused 0
## Unpacking objects: 100% (11/11), done.
## From https://github.com/acupoints/pyqt5-boilerplate
##  * branch            master     -> FETCH_HEAD
##    b7ea854..6f0b707  master     -> origin/master

## 查看当前分支与拉取的分支有何不同
git log -p master origin/master

## 合并拉取的分支到当前分支
git merge origin/master

### 暂用不到，作为补充在此列出
###############################################
## 查看当前分支与当前的分支的上一版本有何不同
git log -p master

### 目录中除了.git之外还有其它文件或目录时称为 non-bare repository
## $ git fetch origin master:master
## fatal: Refusing to fetch into current branch refs/heads/master of non-bare repository

### 借助 git reset 改写历史
## 1. 首先git log查看需要回退到哪个commit id。
## 2. 然后执行git reset –hard commit_id，回退本地版本。
## 3. 最后执行git push origin master –force，将远程版本回退。
## 需要注意的是，这种方法彻底丢失了commit_id之后的修改。
## 
## 1. git rebase -i commit_id~1，进入交互式rebase
## 2. 在git自动打开的编辑器中将该commit行首的pick命令修改为edit并保存
## 3. 修改相应的file，在这个例子中即删除相应“私有”代码
## 4. git add file
## 5. git commit –amend
## 6. 如果有冲突，解决冲突后git add file
## 7. git rebase –continue
## 8. git push [host] [branch] -f
## 
## 如果想舍弃掉整个提交，可以在第2步中，将pick改为drop，然后进入第6步
## 这样就在不影响其他提交的情况下改写了历史

