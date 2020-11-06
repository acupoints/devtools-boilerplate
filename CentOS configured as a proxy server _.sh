yum install -y epel-release
yum install -y 

vim /etc/tinyproxy/tinyproxy.conf
## :set nu
### :23<ENTER>
## 23 Port 9582
### :210<ENTER>
## 210 Allow 127.0.0.1
### :234<ENTER>
## 234 DisableViaHeader Yes
h{#}x
## :noh
## :wq!

systemctl stop firewalld.service
systemctl disable firewalld.service
# systemctl status firewalld.service

systemctl start tinyproxy.service
systemctl enable tinyproxy.service
# systemctl status tinyproxy.service

## iptables v1.4.21
## --append  -A
## --protocol	-p
## --destination -d
## --jump	-j

iptables -A INPUT -p tcp --dport 9582 -j ACCEPT

### Configure machine A as a proxy server with address 192.168.56.115


vim ~/.bashrc

## Add proxy address and port for machine B and machine C
export http_proxy="192.168.56.115:9582"
export https_proxy="192.168.56.115:9582"
export ftp_proxy=$http_proxy

source ~/.bashrc
curl https://www.google.com.hk/
