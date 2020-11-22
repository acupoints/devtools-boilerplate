## VirtualBox 6.1.16 安装 CentOS-8.2.2004

### 系统安装前的配置
[<h>新建]
**名称 {CentOS-8.2.2004}
**内存大小 {4096}+-
**虚拟硬盘 (*)现在创建虚拟硬盘
**虚拟硬盘文件类型 (*)VDI (VirtualBox 磁盘映像)
**存储在物理硬盘上 (*)动态分配
**文件位置和大小 {CentOS-8.2.2004}... ==[60.00GB]

[<h>设置]
[<v>常规][高级]
**共享粘贴板 --[双向]
**拖放 --[双向]
[<v>系统][处理器]
**处理器数量 ==[2]+-
[<v>显示][屏幕]
**显存大小 ==[32MB]+-
[<v>存储]
[控制器: IDE|没有盘片]
**分配光驱 [选择一个虚拟光盘文件...]
[控制器: SATA]
	[+]使用主机输入输出(I/O)缓存
[控制器: SATA|CentOS-8.2.2004.vdi]
	[+]固态驱动器
	[+]热插拨
[<v>网络][网卡1]
[+]启用网络连接
**连接方式 --[网络地址转换(NAT)]
[<v>网络][网卡2]
**连接方式 --[仅主机(Host-Only)网络]


### 安装增强功能所需依赖
#############################################
## 重启
init 6

# dnf group install -y "Development Tools"
dnf install -y elfutils-libelf-devel

# 右Ctrl进入宿主机->设备->安装增强功能

### 测试粘贴复制，拖放文本文件到目录中，而非桌面
#############################################


### 系统安装后的配置
#############################################
### 重启之后，进入自动启动倒计时
### Automatic boot in 25 seconds...
### 此时进入设置菜单移除挂载，然后进入控制菜单选择重启

Ethernet (enp0s3)
------------------
[Details]
[+]Connect automatically (Apply)

Ethernet (enp0s8)
------------------
[Details]
[+]Connect automatically (Apply)

[Privacy]
**Screen Lock {Off}
-------------------------Screen Lock
	**Automatic Screen Lock	++[OFF]
	**Show Notifications ++[OFF]

[Power]
**Blank screen --[Never]

#############################################

~~~
# cat /etc/redhat-release
CentOS Linux release 8.2.2004 (Core) 

# ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.2.15
enp0s8: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.56.103 
