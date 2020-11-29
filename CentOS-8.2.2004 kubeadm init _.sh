## 若已安装，想重新安装或调换主从角色，可重置
## Performs a best effort revert of changes made to this host by 'kubeadm init' or 'kubeadm join'
kubeadm reset
rm -rf $HOME/.kube

### 关闭防火墙
systemctl stop firewalld.service 
systemctl disable firewalld.service

### 禁用SELinux
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

### 启动服务
systemctl enable docker.service && systemctl start docker.service
systemctl enable kubelet.service && systemctl start kubelet.service

export verkube=`kubelet --version | awk -F" " '{print $2}'`
export veraddress=`ifconfig enp0s8 | sed -n '2p' | awk '{print $2}' | sed 's/addr://g'`

swapoff --all
sudo sed -i '/ swap / s/^#*\(.*\)$/#\1/g' /etc/fstab
# cat /etc/fstab

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

kubeadm init --kubernetes-version=$verkube --pod-network-cidr=10.244.0.0/16 \
--service-cidr=10.96.0.0/12 --apiserver-advertise-address $veraddress \
--image-repository registry.aliyuncs.com/google_containers

### 执行下面的命令
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

### 创建flannel
echo ## The GitHub configuration file cannot be downloaded >> /etc/hosts
echo 199.232.68.133 raw.githubusercontent.com >> /etc/hosts

wget https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f kube-flannel.yml

##
### 可选设置
cat <<EOF >> /etc/sysctl.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

sudo sysctl --system

# 未使用 network plugin 或 kubeadm reset 时删除了 /etc/cni/net.d，
# 再次安装时忘记应用网络插件，同样会出现 NotReady，其它原因可通过以下命令查找
kubectl get pod -n kube-system
journalctl -f -u kubelet


