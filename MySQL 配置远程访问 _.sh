## 登录MySQL终端Shell或GUI客户端执行以下SQL语句，
## 即可远程访问某台电脑上的数据库实例，连接时须要指定主机端口和用户密码
######################################################################
use mysql;
select user,host from user;
update user set host='%' where user='root';
flush privileges;
