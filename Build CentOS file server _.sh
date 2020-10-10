## Set up a CentOS file download server
yum install httpd -y
service httpd start
httpd -v

vim /etc/httpd/conf/httpd.conf

Listen 9980
<Directory "/var/www/html">


systemctl stop firewalld.service
systemctl disable firewalld.service

vim /etc/selinux/config
SELINUX=disabled

service httpd restart

mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak
mkdir -p /data/file
ln -s /data/file  /var/www/html/
echo "hello world" >> /data/file

## 挂载共享目录
# SETP-01
VirtualBox 管理器 --> 编组|CentOS master|设置 --> 共享文件夹|临时分配|添加共享文件夹
**共享文件夹路径{C:\Users\literal\Desktop\CentOS-assets}
**共享文件夹名称{CentOS-assets}(*选择了本地目录后会自动生成，此后挂载会用到这个名字)

[-] 只读分配
[-] 自动挂载
[-] 固定分配
(*以上三项无须勾选)
(OK)
# STEP-02
# 创建服务根目录的软链接，也就是快捷方式
## mkdir -p /data/file
## ln -s /data/file  /var/www/html/
# 挂载(*和取消挂载共享目录)
mount -t vboxsf CentOS-assets /data/file/
umount /data/file/

