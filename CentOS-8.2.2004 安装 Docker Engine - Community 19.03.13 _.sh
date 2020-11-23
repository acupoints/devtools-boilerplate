## 卸载早期安装的版本
[root@localhost gullies]# yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

## 安装新版本
[root@localhost gullies]# yum install -y yum-utils device-mapper-persistent-data lvm2
[root@localhost gullies]# yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
[root@localhost gullies]# yum install -y docker-ce docker-ce-cli containerd.io --nobest
[root@localhost gullies]# systemctl start docker.service
[root@localhost gullies]# systemctl enable docker.service
[root@localhost gullies]# docker --version


## 去掉了提示符，方便整体复制，快速安装新版本
###########################################################################
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io --nobest
systemctl start docker.service
systemctl enable docker.service
docker --version

## 常用数据库镜像拉取
# docker pull postgres
# docker pull postgres:13.1
docker pull postgres:12.5

# docker pull redis
# docker pull redis:6.0.9
docker pull redis:5.0.10

# docker pull mysql
# docker pull mysql:8.0.22
docker pull mysql:5.7.32


