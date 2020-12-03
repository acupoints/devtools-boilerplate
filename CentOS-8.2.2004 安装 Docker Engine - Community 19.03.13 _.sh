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
docker pull redis:6.0.9
docker pull redis:6.0.9-alpine
docker pull redis:6.0.9-alpine3.12
# docker pull redis:5.0.10

# docker pull mysql
# docker pull mysql:8.0.22
docker pull mysql:5.7.32

# docker pull mariadb
docker pull mariadb:10.5.8

# docker pull ubuntu
docker pull ubuntu:18.04

## 生态脚本控制工具
# docker pull nginx
docker pull nginx:1.19.5
docker pull nginx:1.19.5-alpine

# docker pull node
# docker pull node:12.16.3
docker pull node:12.20.0
docker pull node:12.20.0-alpine
docker pull node:12.20.0-alpine3.12
# docker pull node:14.15.1
# docker pull node:14.15.1-alpine
# docker pull node:14.15.1-alpine3.12

# docker pull ruby
# docker pull ruby:2.6.5
docker pull ruby:2.6.6
docker pull ruby:2.6.6-alpine
docker pull ruby:2.6.6-alpine3.12

# docker pull python
# docker pull python:3.7.6
docker pull python:3.7.9
docker pull python:3.7.9-alpine
docker pull python:3.7.9-alpine3.12
# docker pull python:3.8.6
# docker pull python:3.8.6-alpine
# docker pull python:3.8.6-alpine3.12


