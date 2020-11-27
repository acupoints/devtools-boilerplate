## 准备系统，下载官网镜像 CentOS-8.2.2004
http://mirrors.aliyun.com/centos/8.2.2004/isos/x86_64/
http://mirror.hostlink.com.hk/centos/8.2.2004/isos/x86_64/

## 准备优盘，制作启动盘
https://sourceforge.net/projects/win32diskimager/
在这个链接页面下载Win32 Disk Imager
## 选择映像文件 *.* ，找到 CentOS-8.2.2004-x86_64-dvd1.iso ，写入完成即可使用。

## 重启笔记本，看到提示按下F12，选择U盘启动
SYSTEM
Installation Destination
***Automatic partitioning selected

## 在磁盘选择界面，分区选择自动，在磁盘空间不够用时可以勾选想要附加可用空间，
## 单击Done进入下一步，然后单击删除所有，单击Done完成安装目标设置
*Device Selection
----------------------------------
**Local Standard Disks
ATA VBox HARDDISK
sda / 60 GiB free

**Storage Configuration
(*)Automatic
## 如果 sda / xx GiB free 空间不够用可以勾选想要附加可用空间
[+] I would like to make additional space available.

## CentOS-8.2.2004 新功能，开启后可在9090端口访问WEB控制台
systemctl enable --now cockpit.socket

