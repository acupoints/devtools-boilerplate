
wget http://nginx.org/download/nginx-1.19.5.tar.gz
yum install -y pcre pcre-devel zlib zlib-devel openssl openssl-devel
yum install -y gcc gcc-c++

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

