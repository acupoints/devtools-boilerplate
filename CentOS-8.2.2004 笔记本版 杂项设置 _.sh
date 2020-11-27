## 笔记本合上盖子不休眠
[root@localhost gullies]# vim /etc/systemd/logind.conf
:/Lid
:set nu
:25<ENTER>
:noh
HandleLidSwitchExternalPower=locK

[root@localhost gullies]# systemctl restart systemd-logind

