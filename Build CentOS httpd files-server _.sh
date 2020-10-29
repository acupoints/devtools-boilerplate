vim /etc/selinux/config
SELINUX=disabled
reboot

su root
yum install httpd -y
httpd -version

vim /etc/httpd/conf/httpd.conf
### :set nu
### :42<ENTER>
 42 Listen 9581
### 解决中文乱码
### :32<ENTER>
 32 IndexOptions Charset=UTF-8

mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.bak

systemctl start httpd
systemctl enable httpd

mkdir -p /data/files
ln -s /data/files  /var/www/html/
echo "hello world" > /data/files/1.txt
cp /etc/httpd/conf.d/welcome.conf.bak /data/files/welcome.conf

## 创建共享文件夹
虚拟机|设置|共享文件夹|临时分配|添加共享文件夹
**共享文件夹路径{C:\Users\literal\Desktop\CentOS-assets}
**共享文件夹名称{CentOS-assets}(*选择了本地目录后会自动生成，此后挂载会用到这个名字)
[-] 只读分配
[-] 自动挂载
[-] 固定分配

(*以上三项无须勾选)
(OK)

## 挂载共享文件夹
mount -t vboxsf CentOS-assets /data/files
## 取消挂载共享文件夹
umount /data/file/

## 防火墙可以不用设置
systemctl stop firewalld
systemctl disable firewalld

