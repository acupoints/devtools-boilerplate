##
yum install -y pcre pcre-devel zlib zlib-devel openssl openssl-devel
yum install -y gcc gcc-c++

wget http://nginx.org/download/nginx-1.19.5.tar.gz
tar -xzfv nginx-1.19.5.tar.gz
cd nginx-1.19.5
./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module

make && make install
cd /usr/local/nginx
./sbin/nginx


## 仅配置编译模块，不要执行make install命令，会覆盖现有安装
cd nginx-1.19.5
./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_stub_status_module
make

## 启动服务，设置开机运行
systemctl start nginx
systemctl enable nginx

## 查找安装目录，并卸载
ps -ef | grep nginx
kill -QUIT 65026
whereis nginx
rm -rf /usr/local/nginx
yum remove nginx

####################################################
λ scp 4803322_fy1m.cn_nginx.zip root@47.113.207.82:/usr/local/nginx
root@47.113.207.82's password:
4803322_fy1m.cn_nginx.zip
-------------
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ps -ef | grep nginx
root       64517       1  0 07:18 ?        00:00:00 nginx: master process /usr/local/nginx/sbin/nginx
nobody     64518   64517  0 07:18 ?        00:00:00 nginx: worker process
root       65017   64854  0 11:16 pts/1    00:00:00 grep --color=auto nginx
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64517
[root@iZf8z60eamajlim8a6nbtrZ nginx]# kill -QUIT 64518
-bash: kill: (64518) - No such process
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ps -ef | grep nginx
root       65022   64854  0 11:17 pts/1    00:00:00 grep --color=auto nginx
[root@iZf8z60eamajlim8a6nbtrZ nginx]# ls
client_body_temp  conf  fastcgi_temp  fy1m_cert  html  logs  proxy_temp  sbin  scgi_temp  uwsgi_temp


