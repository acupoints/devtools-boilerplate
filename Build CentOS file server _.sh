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
