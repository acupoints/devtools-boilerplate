## 安装依赖包
yum install -y pcre pcre-devel zlib zlib-devel openssl openssl-devel
yum install -y gcc gcc-c++

## 下载并配置
wget http://nginx.org/download/nginx-1.19.5.tar.gz
tar xzfv nginx-1.19.5.tar.gz
cd nginx-1.19.5
./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module

## 编译并安装
make && make install
cd /usr/local/nginx
./sbin/nginx

## 启动服务，设置开机运行
systemctl start nginx
systemctl enable nginx

## 设置防火墙，开放指定端口重新加载之后，即可网络访问
[root@localhost nginx]# systemctl status
● localhost.localdomain
    State: running
     Jobs: 0 queued
   Failed: 0 units
    Since: Mon 2020-11-23 16:46:57 EST; 1 day 16h ago
   CGroup: /
           ├─user.slice
           │ ├─user-42.slice
           │ │ ├─session-c2.scope
           │ │ │ ├─1864 gdm-session-worker [pam/gdm-launch-environment]

[root@localhost nginx]# firewall-cmd --list-ports
[root@localhost nginx]# firewall-cmd --zone=public --add-port=80/tcp --permanent
success
[root@localhost nginx]# firewall-cmd --reload
success
[root@localhost nginx]#


## 查找进程，退出应用
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ps -ef | grep nginx
root       64517       1  0 07:18 ?        00:00:00 nginx: master process /usr/local/nginx/sbin/nginx
nobody     64518   64517  0 07:18 ?        00:00:00 nginx: worker process
root       65017   64854  0 11:16 pts/1    00:00:00 grep --color=auto nginx
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64517
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64518

## 卸载应用
whereis nginx
rm -rf /usr/local/nginx
yum remove nginx

