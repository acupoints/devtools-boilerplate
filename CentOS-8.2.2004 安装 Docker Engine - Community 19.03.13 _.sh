## 卸载早期安装的版本
yum list installed | grep docker
yum remove -y containerd.io.x86_64

## 去掉了提示符，方便整体复制，快速安装新版本
###########################################################################
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum -y install docker-ce --nobest
systemctl start docker.service
systemctl enable docker.service
docker --version


## 常用的数据库镜像拉取
# docker pull postgres
# docker pull postgres:13.1
docker pull postgres:12.5

# docker pull redis
# docker pull redis:6.0.9
docker pull redis:5.0.10

# docker pull mysql
# docker pull mysql:8.0.22
docker pull mysql:5.7.32

# docker pull nginx
docker pull nginx:1.19.5

# docker pull mariadb
docker pull mariadb:10.5.8

# docker pull ubuntu
docker pull ubuntu:18.04


