/**
* Generate SSH keys and add it to github or gitlab
*/

### STEP 01
ssh-keygen -t rsa -C "lanbinzheng@foxmail.com" -b 4096
{ENTER}{ENTER}{ENTER}

### STEP 02
cat ~/.ssh/id_rsa.pub | clip
{ENTER}

### STEP 03
ssh -T git@github.com
{yes}{ENTER}

## ------------------------------
ssh -T git@github.com
{yes}{ENTER}

=== 疑惑 01
$ ssh -T git@github.com
Hi acupoints! You've successfully authenticated, but GitHub does not provide shell access.

[控制面板][用户帐户][凭据管理器][Windows 凭据]
git:https://github.com
(删除)_

=== 疑惑 02
gullies@gullies-VirtualBox:~$ rvm --version
Warning! PATH is not properly set up, /home/gullies/.rvm/gems/ruby-2.6.5/bin is not at first place.
### 这个提示在Bash Shell 配置文件中已经说明，导出变量，排在第一
### 移动一下RVM 变量的位置到文件最后，保存退出即可
gullies@gullies-VirtualBox:~$ vim ~/.bashrc
...
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
source /home/gullies/.rvm/scripts/rvm

