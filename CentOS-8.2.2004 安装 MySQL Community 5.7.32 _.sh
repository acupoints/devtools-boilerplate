## 彻底卸载 MySQL Community 5.7.32
[root@localhost nginx]# rpm -qa | grep -i mysql
yum remove -y mysql-community-server-5.7.32-1.el7.x86_64
yum remove -y mysql-community-libs-5.7.32-1.el7.x86_64
yum remove -y mysql57-community-release-el7-10.noarch
yum remove -y mysql-community-client-5.7.32-1.el7.x86_64
yum remove -y mysql-community-common-5.7.32-1.el7.x86_64

[root@localhost nginx]# find / -name mysql
rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/mysql
rm -rf /usr/share/mysql
##
rm -rf /var/log/mysqld.log


## 下载社区版mysql
wget http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum install -y mysql57-community-release-el7-10.noarch.rpm
yum install -y mysql-community-server
--------------------------------------
All matches were filtered out by modular filtering for argument: mysql-community-server
Error: Unable to find a match: mysql-community-server
[root@localhost nginx]#

## 默认启用的mysql模块，会屏蔽存储库提供的软件包，所有在此禁用，以便从存储库安装。
yum module disable mysql
yum install -y mysql-community-server

## 启动mysql服务
systemctl start mysqld
systemctl enable mysqld

## 查看随机密码
[root@localhost nginx]# grep "password" /var/log/mysqld.log
2020-11-25T17:18:14.945685Z 1 [Note] A temporary password is generated for root@localhost: hs7aOM5Yey+i

## 登录mysql客户端
[root@localhost nginx]# mysql -uroot -p

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

## 重置密码时遇到验证错误，需要首先调整验证策略，然后再修改密码
mysql> set password=password('Umph2014');
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
mysql> set global validate_password_policy=0;
Query OK, 0 rows affected (0.00 sec)

mysql> set password=password('Umph2014');
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql>
--------------------------------------
## 设置允许远程访问数据库
use mysql;
select host,user,authentication_string from user;
grant all privileges on *.* to 'root'@'%' identified by 'Umph2014';
select host,user,authentication_string from user;
flush privileges;

mysql> \q
Bye
[root@localhost nginx]#

## 设置防火墙，打开指定的端口重新加载之后，即可网络访问
[root@localhost nginx]# firewall-cmd --zone=public --add-port=3306/tcp --permanent
success
[root@localhost nginx]# firewall-cmd --reload
success
[root@localhost nginx]# firewall-cmd --list-ports
3306/tcp

