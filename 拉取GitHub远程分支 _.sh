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

