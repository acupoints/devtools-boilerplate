## 若已安装，想重新安装或调换主从角色，可重置
## Performs a best effort revert of changes made to this host by 'kubeadm init' or 'kubeadm join'
kubeadm reset
rm -rf $HOME/.kube

~~~关闭防火墙
==================
systemctl stop firewalld.service 
systemctl disable firewalld.service

~~~禁用SELinux
sed -ie 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
cd /etc/yum.repos.d/
wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

cat>>/etc/yum.repos.d/kubrenetes.repo<<EOF
[kubernetes]
name=Kubernetes Repo
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/
gpgcheck=0
gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg
EOF

yum install -y docker-ce kubeadm --nobest
hostnamectl set-hostname gullies-master && su root

~~~启动服务
==============================
systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

inet_addr=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr://g'`
export verkube=v1.19.4
export veraddress=${inet_addr}

swapoff --all
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
# cat /etc/fstab

kubeadm init --kubernetes-version=$verkube --pod-network-cidr=10.244.0.0/16 \
--service-cidr=10.96.0.0/12 --apiserver-advertise-address $veraddress \
--image-repository registry.aliyuncs.com/google_containers

~~~执行下面的命令
===========================================================================
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

~~~创建flannel
==============================
echo ## The GitHub configuration file cannot be downloaded >> /etc/hosts
echo 199.232.68.133 raw.githubusercontent.com >> /etc/hosts

wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f kube-flannel.yml

~~~使用 "systemd" as the Docker cgroup driver
============================================
### Docker cgroup driver
[preflight] Running pre-flight checks
        [WARNING IsDockerSystemdCheck]: detected "cgroupfs" as the Docker cgroup driver. The recommended driver is "systemd".
--------------------------------------------------------------
# docker info | grep Cgroup
cat>>/etc/docker/daemon.json<<EOF
{
   "exec-opts": ["native.cgroupdriver=systemd"]
}
EOF

##
systemctl restart docker
docker info | grep Cgroup
systemctl daemon-reload

~~~查看集群命令
============================================
inet_addr=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr://g'`
kadm_token=`kubeadm token create`
kadm_token_hash=`openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'`
kadm_join="kubeadm join ${inet_addr}:6443 --token ${kadm_token}     --discovery-token-ca-cert-hash sha256:${kadm_token_hash}"
kadm_join_tips="Then you can join any number of worker nodes by running the following on each as root:"
echo -e "\033[33m\n${kadm_join_tips}\n\033[37m\nswapoff --all\033[36m\n${kadm_join}\n\033[0m"


~~~暂未用到
============================================
cat <<EOF >> /etc/sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

Another app is currently holding the yum lock; waiting for it to exit...
~~~
rm -f /var/run/yum.pid


