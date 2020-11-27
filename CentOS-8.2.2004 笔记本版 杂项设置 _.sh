### 笔记本合上盖子不休眠
#######################################################################
[root@localhost gullies]# vim /etc/systemd/logind.conf
:/Lid
:set nu
:24<ENTER>
:noh
HandleLidSwitch=lock

### 重启此服务太慢，推荐 reboot 重启
[root@localhost gullies]# systemctl restart systemd-logind

### Win10 hosts not found
#######################################################################
cmd admin> for /f %P in ('dir %windir%\WinSxS\hosts /b /s') do copy %P %windir%\System32\drivers\etc & echo %P & Notepad %P

### 墙内访问 GitHub 用户原生文件
#######################################################################
echo ## The GitHub configuration file cannot be downloaded >> /etc/hosts
echo 199.232.68.133 raw.githubusercontent.com >> /etc/hosts
