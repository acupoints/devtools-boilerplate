## 查找进程，退出应用
[root@localhost gullies]# ps -ef | grep nginx
root       50190       1  0 11:23 ?        00:00:00 nginx: master process ./sbin/nginx
nobody     50191   50190  0 11:23 ?        00:00:00 nginx: worker process
root       54715   52949  0 14:13 pts/1    00:00:00 grep --color=auto nginx
[root@localhost gullies]# kill -QUIT 50190
[root@localhost gullies]# ps -ef | grep nginx
root       54730   52949  0 14:13 pts/1    00:00:00 grep --color=auto nginx
[root@localhost gullies]#

## 卸载应用
[root@localhost gullies]# whereis nginx
nginx: /usr/local/nginx
[root@localhost gullies]# rm -rf /usr/local/nginx
[root@localhost gullies]#


## 安装依赖包
###############################################
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

###############################################

## 启动服务，设置开机运行
systemctl start nginx
systemctl enable nginx

## 设置防火墙，打开指定的端口重新加载之后，即可网络访问
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

## 打开指定的端口并重新加载，再查询就能看到刚打开的端口
[root@localhost nginx]# firewall-cmd --zone=public --add-port=80/tcp --permanent
success
[root@localhost nginx]# firewall-cmd --reload
success
[root@localhost nginx]# firewall-cmd --list-ports
80/tcp

### 补充
## nginx 配置https域名访问
#####################################################
C:\Users\Administrator\Desktop
λ scp -r 4803322_fy1m.cn_nginx.zip gullies@192.168.56.101:/usr/local/nginx/fy1m_cert
gullies@192.168.56.101's password:
scp: /usr/local/nginx/fy1m_cert/4803322_fy1m.cn_nginx.zip: Permission denied

## 见到 Permission denied 说明目标文件夹没有写入权限，如何添加权限往下接着读
----------------------------------------------------
[root@localhost nginx]# mkdir fy1m_cert
[root@localhost nginx]# ls
client_body_temp  conf  fastcgi_temp  fy1m_cert  html  logs  nginx.conf.bak  proxy_temp  sbin  scgi_temp  uwsgi_temp
[root@localhost nginx]# pwd
/usr/local/nginx
[root@localhost nginx]# ls
client_body_temp  conf  fastcgi_temp  fy1m_cert  html  logs  nginx.conf.bak  proxy_temp  sbin  scgi_temp  uwsgi_temp
[root@localhost nginx]# chmod 777 fy1m_cert/
[root@localhost nginx]#

## 给目标文件夹添加好权限，接着拷贝证书，可以看出这次成功上传
----------------------------------------------------
C:\Users\Administrator\Desktop
λ scp -r 4803322_fy1m.cn_nginx.zip gullies@192.168.56.101:/usr/local/nginx/fy1m_cert
gullies@192.168.56.101's password:
4803322_fy1m.cn_nginx.zip                                                                      100% 4156   831.7KB/s   00:00

C:\Users\Administrator\Desktop
## 回到服务器端，解压证书
----------------------------------------------------
[root@localhost nginx]# ls
client_body_temp  conf  fastcgi_temp  fy1m_cert  html  logs  nginx.conf.bak  proxy_temp  sbin  scgi_temp  uwsgi_temp
[root@localhost nginx]# ls fy1m_cert/
4803322_fy1m.cn_nginx.zip
[root@localhost nginx]# unzip fy1m_cert/4803322_fy1m.cn_nginx.zip -d fy1m_cert/
Archive:  fy1m_cert/4803322_fy1m.cn_nginx.zip
Aliyun Certificate Download
  inflating: fy1m_cert/4803322_fy1m.cn.pem
  inflating: fy1m_cert/4803322_fy1m.cn.key
[root@localhost nginx]# ls fy1m_cert/
4803322_fy1m.cn.key  4803322_fy1m.cn_nginx.zip  4803322_fy1m.cn.pem
[root@localhost nginx]#

### 证书有了，就该配置nginx的https域名访问了。
----------------------------------------------------
    #gzip  on;                                  
                                                
    server {                                    
        listen       80;                        
----------------------------------------------------配置以下2行
        #server_name  localhost;
        server_name  fy1m.cn www.fy1m.cn;                 
        return      301 https://$server_name$request_uri;
	
        #charset koi8-r;                        
                                                
        #access_log  logs/host.access.log  main;

### 配置证书
###############################################################
    # HTTPS server
    #
    server {
        listen       443 ssl;
----------------------------------------------------配置以下3行
        #server_name  localhost;
        server_name  fy1m.cn www.fy1m.cn;

        #ssl_certificate      cert.pem;
        ssl_certificate      ../fy1m_cert/4803322_fy1m.cn.pem;
        #ssl_certificate_key  cert.key;
        ssl_certificate_key  ../fy1m_cert/4803322_fy1m.cn.key;

        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
----------------------------------------------------配置以下1行
	##
	ssl_protocols TLSv1 TLSv1.1 TLSv1.2;

        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;

        location / {
            root   html;
            index  index.html index.htm;
        }
    }
    
## 重启 nginx
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=8000/tcp --permanent
firewall-cmd --reload
## 查看打开的端口
firewall-cmd --list-ports


