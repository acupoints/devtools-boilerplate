### 查看改写历史前后的项目结构(之前)
############################################################################################
## λ TREE /F /A .
## 文件夹 PATH 列表
## 卷序列号为 82A9-D16F
## C:\USERS\LITERAL\DESKTOP\0706_02\PYQT5-BOILERPLATE
## |   .gitignore
## |   .pylintrc
## |   acupoint.py
## |   ml.png
## |
## +---.vscode
## |   \---.ropeproject
## |           config.py
## |           objectdb
## |
## \---Acupoints
##         ConfigManager.py
##         demo.json
##         SrcManager.py
##         __init__.py

### 查看改写历史前后的项目结构(之后)
############################################################################################
## λ TREE /F /A .
## 文件夹 PATH 列表
## 卷序列号为 82A9-D16F
## C:\USERS\LITERAL\DESKTOP\0706_02\PYQT5-BOILERPLATE
## |   .gitignore
## |   .pylintrc
## |   acupoint.py
## |
## \---Acupoints
##         ConfigManager.py
##         demo.json
##         SrcManager.py
##         __init__.py

### 从GitHub历史版本中删除文件或目录
############################################################################################
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git filter-branch --force --prune-empty --index-filter "git rm -rf --cached --ignore-unmatch ml.png" --tag-name-filter cat -- --all
## Rewrite 4bcf3901f2eadedefc2d08ff3e258e515eb8fc7c (2/6) (1 seconds passed, remaining 2 predicted)    rm 'ml.png'
## Rewrite 0da9c1c04cd2a6dbc0588b78b0ecb920d13142b7 (2/6) (1 seconds passed, remaining 2 predicted)    rm 'ml.png'
## Rewrite b7ea85463ec258b66229793c33d024f0665d0673 (2/6) (1 seconds passed, remaining 2 predicted)    rm 'ml.png'
## Rewrite 6f0b707a3e761f3fe187e82d59ce423c0c7efd11 (5/6) (3 seconds passed, remaining 0 predicted)    rm 'ml.png'
## Rewrite 528c439ed8c863ad5d578535da879c574fdc66d5 (5/6) (3 seconds passed, remaining 0 predicted)    rm 'ml.png'
## 
## Ref 'refs/heads/master' was rewritten
## Ref 'refs/remotes/origin/master' was rewritten
## WARNING: Ref 'refs/remotes/origin/master' is unchanged
## 
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git filter-branch --force --prune-empty --index-filter "git rm -rf --cached --ignore-unmatch .vscode/" --tag-name-filter cat -- --all
## Rewrite c53caf383924c5b6b901859074eb579ca28ed541 (3/6) (1 seconds passed, remaining 1 predicted)    rm '.vscode/.ropeproject/config.py'
## rm '.vscode/.ropeproject/objectdb'
## Rewrite 9020794d5f914bac2734abaa1a5dbf775bab4414 (3/6) (1 seconds passed, remaining 1 predicted)    rm '.vscode/.ropeproject/config.py'
## rm '.vscode/.ropeproject/objectdb'
## 
## Ref 'refs/heads/master' was rewritten
## Ref 'refs/remotes/origin/master' was rewritten
## WARNING: Ref 'refs/remotes/origin/master' is unchanged
## 
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git remote --verbose
## origin  https://github.com/acupoints/pyqt5-boilerplate.git (fetch)
## origin  https://github.com/acupoints/pyqt5-boilerplate.git (push)
## 
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git push origin master --force --all --tags
## fatal: --all and --tags are incompatible
## 

### 强制推送携带 --all 没能成功，携带 --tags 时成功了，并且远程仓库目录结构已发生变化
############################################################################################
## git-push(1) Manual Page
## --all
## Push all branches (i.e. refs under refs/heads/); cannot be used with other <refspec>.
## --tags
## All refs under refs/tags are pushed, in addition to refspecs explicitly listed on the command line.

## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git push origin master --force --all
## fatal: --all can't be combined with refspecs
## 
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)
## $ git push origin master --force --tags
## Enumerating objects: 26, done.
## Counting objects: 100% (26/26), done.
## Delta compression using up to 4 threads
## Compressing objects: 100% (22/22), done.
## Writing objects: 100% (25/25), 5.11 KiB | 747.00 KiB/s, done.
## Total 25 (delta 5), reused 0 (delta 0)
## remote: Resolving deltas: 100% (5/5), done.
## To https://github.com/acupoints/pyqt5-boilerplate.git
##  + 528c439...d6deaed master -> master (forced update)
## 
## literal@artemisia MINGW64 ~/Desktop/0706_02/pyqt5-boilerplate (master)

